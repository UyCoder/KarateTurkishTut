package meetup;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

/**
 * Project:     KarateTurkishTut
 * Package:     src/test/java/meetup
 * Created:     12/9/2021 20:55
 * Author:      Ahmed-UTI
 * Email:       AhmedBughra@gmail.com
 * CreatedWith: IntelliJ IDEA
 */

public class ParallelRunner {

    @Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }


//    @Test
//    public void testParallel() {
//        Results results = Runner.path("classpath:").tags("~@ignore").parallel(13);
//        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
//    }

    // mvn test -Dtest=ParallelRunner
}
