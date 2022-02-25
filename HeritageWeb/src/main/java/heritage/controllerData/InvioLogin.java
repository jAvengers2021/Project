package heritage.controllerData;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import heritage.model.User;

public class InvioLogin {

	public static User recuperaUtente(String nickname, String password) {
		
		// Utente placeholder
		if(nickname.equals("guest") && password.equals("guest")) {
			return new User(3, 19, "guest", "guest@guest.guest");
		}
		
		//
		String result = "-1";

		try {
			// Dovete accendere il server per eseguire questa!!
			URL paginaURL = new URL("http://localhost:8081/verificaLogin");

			HttpURLConnection client = (HttpURLConnection) paginaURL.openConnection();
			client.setRequestMethod("POST");
			client.setDoInput(true);
			client.setDoOutput(true);

			OutputStream os = client.getOutputStream();
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
			writer.write("nickname=" + nickname + "&password=" + password);
			writer.flush();
			writer.close();
			os.close();

			client.connect();

			int responseCode = client.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine + "\n");
				}
				
				in.close();
				result = response.toString();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		User user = null;
		try {
			ObjectMapper mapper=new ObjectMapper();
			TypeReference<User> typeRefUsers = new TypeReference<User>() {};
			 user = mapper.readValue(result, typeRefUsers);
		}
		 catch (JsonMappingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} catch (JsonProcessingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		
		result = result.trim();
		//int valore = Integer.parseInt(result);
		return user;
	}
}
