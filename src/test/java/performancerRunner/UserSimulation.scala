package performancerRunner

import com.intuit.karate.gatling.PreDef.{karateFeature, karateProtocol}
import io.gatling.core.Predef.{Simulation, exec, openInjectionProfileFactory, rampUsers, scenario}

import scala.concurrent.duration.DurationInt

class UserSimulation extends Simulation{

  val myFirstLoadTest = scenario("my First Load Test").exec(karateFeature("classpath:meetup/tasks.feature"))

  val protocol = {
    karateProtocol()
  }

  setUp(
    myFirstLoadTest.inject(rampUsers(20) during(20 seconds)).protocols(protocol)
  )
}