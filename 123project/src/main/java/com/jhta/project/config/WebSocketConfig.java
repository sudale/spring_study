package com.jhta.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.jhta.project.handler.SocketHandler;


@Configuration
@EnableWebSocket
@ComponentScan("com.jhta.project.handler")
public class WebSocketConfig implements WebSocketConfigurer {
	@Autowired SocketHandler socketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler,"/chating");
	}
}
