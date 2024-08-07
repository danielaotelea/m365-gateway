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

/** Azure Functions with HTTP Trigger. */
public class Function {
  @FunctionName("HealthHttpExample")
  public HttpResponseMessage run(
      @HttpTrigger(
              name = "req",
              methods = {HttpMethod.GET, HttpMethod.POST},
              authLevel = AuthorizationLevel.ANONYMOUS)
          HttpRequestMessage<Optional<String>> request,
      final ExecutionContext context) {
    context.getLogger().info("[Success][InitTest]Java HTTP trigger processed a request.");

    final String query = request.getQueryParameters().get("name");
    final String name = request.getBody().orElse(query);

    if (name == null) {
      return request
          .createResponseBuilder(HttpStatus.BAD_REQUEST)
          .body("Please pass a name on the query string or in the request body")
          .build();
    } else {
      return request.createResponseBuilder(HttpStatus.OK).body("Hello, " + name).build();
    }
  }
}
