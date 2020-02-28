package com.duedil.cicd_test

import io.vertx.core.Handler
import io.vertx.core.Promise
import io.vertx.core.Vertx
import io.vertx.ext.healthchecks.HealthCheckHandler
import io.vertx.ext.healthchecks.HealthChecks
import io.vertx.ext.healthchecks.Status
import io.vertx.ext.web.Router
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
      val vertx = Vertx.vertx()
      val router = Router.router(vertx)

      val healthCheckHandler: HealthCheckHandler = HealthCheckHandler.createWithHealthChecks(HealthChecks.create(vertx))

      healthCheckHandler.register(
        "basic check",
        Handler { future: Promise<Status?> ->
          future.complete(Status.OK())
        }
      )
      router.route("/healthcheck").handler(healthCheckHandler)

      router.route("/dummy").handler { req ->
        req.response()
          .putHeader("content-type", "text/plain")
          .end(DummyService().dummyAction())
      }

      vertx.createHttpServer(httpServerOptions).requestHandler(router).listen(8080)

    }
  }
}
