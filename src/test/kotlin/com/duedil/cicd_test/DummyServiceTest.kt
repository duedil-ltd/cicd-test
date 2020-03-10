package com.duedil.cicd_test

import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*

internal class DummyServiceTest {

    @Test
    fun dummyAction() {
      assertEquals("fail dummy response", DummyService().dummyAction())
    }
}
