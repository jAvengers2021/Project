package heritage.controllerData;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.LinkedList;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class RecuperoJson<T> {

	public String downloadJson(String url) {
		String result = "";

		try {
			// Dovete accendere il server per eseguire questa!!
			URL paginaURL = new URL(url);

			HttpURLConnection client = (HttpURLConnection) paginaURL.openConnection();
			// client.setRequestProperty(result, result);

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
		return result;
	}

	public List<T> getList(String url, Class<T> contentClass) {
		String jSon = downloadJson(url);
		try {
			ObjectMapper mapper = new ObjectMapper();
			JavaType type = mapper.getTypeFactory().constructParametricType(LinkedList.class, contentClass);
			// TypeReference<List<T>> typeRef = new TypeReference<List<T>>() {};
			List<T> list = mapper.readValue(jSon, type);
			return list;
		} catch (JsonMappingException e) {
			List<T> list = new LinkedList<T>();
			e.printStackTrace();
			return list;
		} catch (JsonProcessingException e) {
			List<T> list = new LinkedList<T>();
			e.printStackTrace();
			return list;
		}
	}

	public T getObject(String url, Class<T> contentClass) {
		String jSon = downloadJson(url);
		try {
			ObjectMapper mapper = new ObjectMapper();
			JavaType type = mapper.constructType(contentClass);
			//JavaType type = mapper.getTypeFactory().constructParametricType(Object.class, contentClass);
			T object = mapper.readValue(jSon, type);
			return object;
		} catch (JsonMappingException e) {
			T object = null;
			e.printStackTrace();
			return object;
		} catch (JsonProcessingException e) {
			T object = null;
			e.printStackTrace();
			return object;
		}
	}
}
