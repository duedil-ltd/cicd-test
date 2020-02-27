package com.duedil.cicd_test

import io.vertx.core.Vertx
import io.vertx.kotlin.core.http.httpServerOptionsOf


class Main {

  companion object {

    @JvmStatic
    fun main(args: Array<String>) {
      Server().startServer()
    }
  }

  class Server {

    fun startServer() {
      val httpServerOptions = httpServerOptionsOf(logActivity = true)
      Vertx.vertx().createHttpServer(httpServerOptions)
        .requestHandler { req ->
          req.response()
            .putHeader("content-type", "text/plain")
            .end(DummyService().dummyAction())
        }.listen(8888)

    }
  }
}
