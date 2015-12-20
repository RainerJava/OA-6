package org.qf.oa;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;

public class HelloListener implements ServletContextListener {
	private static final String CHANNEL = "hello";

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO 自动生成的方法存根

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		CometContext cc = CometContext.getInstance();
		cc.registChannel(CHANNEL);// 注册应用的channel
		Thread helloAppModule = new Thread(new HelloAppModule(),
				"Sender App Module");
		helloAppModule.setDaemon(true);
		helloAppModule.start();
	}

	class HelloAppModule implements Runnable {
		public void run() {
			while (true) {				
				try {
					Thread.sleep(1000);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				CometEngine engine = CometContext.getInstance().getEngine();
				engine.sendToAll(CHANNEL,
						Runtime.getRuntime().freeMemory() / 1024);
			}
		}
	}

}
