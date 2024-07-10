package ch.vontobel.m365;

import com.microsoft.azure.functions.ExecutionContext;
import com.microsoft.azure.functions.HttpMethod;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;
import com.microsoft.azure.functions.annotation.AuthorizationLevel;
import com.microsoft.azure.functions.annotation.FunctionName;
import com.microsoft.azure.functions.annotation.HttpTrigger;

import java.util.Optional;

/**
 * Azure Functions with HTTP Trigger.
 */
public class TestJFunction {
    /**
     * This function listens at endpoint "/api/TestJFunction". Two ways to invoke it using "curl" command in bash:
     * 1. curl -d "HTTP Body" {your host}/api/TestJFunction
     * 2. curl {your host}/api/TestJFunction?name=HTTP%20Query
     */
    @FunctionName("ChangeWithAPIGatewayFunction")
    public HttpResponseMessage run(
            @HttpTrigger(
                    name = "req",
                    methods = {HttpMethod.GET, HttpMethod.POST},
                    authLevel = AuthorizationLevel.ANONYMOUS) HttpRequestMessage<Optional<String>> request,
            final ExecutionContext context) {
        context.getLogger().info("Daniela Second HTTP trigger processed a request.");
        String query = request.getQueryParameters().get("name");
        String name = request.getBody().orElse(query);

        if (name != null) {
            return request.createResponseBuilder(HttpStatus.OK).body("Hello, " + name).build();
        } else {
            return request.createResponseBuilder(HttpStatus.OK)
                    .body("Hello, World!")
                    .build();
        }
    }
}
