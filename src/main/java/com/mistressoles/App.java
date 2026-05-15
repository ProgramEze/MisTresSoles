package com.mistressoles;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;
import java.net.URL;

/**
 * JavaFX App
 */
public class App extends Application {

    private static Scene scene;

    // 1. En el método start, usa la ruta completa con el .fxml incluido para mayor seguridad
    @Override
    public void start(Stage stage) throws IOException {
        scene = new Scene(loadFXML("/com/mistressoles/views/dashboard/dashboard.fxml"), 900, 600);
        stage.setScene(scene);
        stage.setTitle("Mis Tres Soles - Gestión de Verdulería");
        stage.show();
    }

// 2. Modificá el método loadFXML para que sea más robusto
    private static Parent loadFXML(String fxmlPath) throws IOException {
        // Usamos el cargador de recursos del sistema para que la ruta sea absoluta
        URL fxmlLocation = App.class.getResource(fxmlPath);

        if (fxmlLocation == null) {
            throw new IOException("ERROR CRÍTICO: No se encontró el archivo en la ruta: " + fxmlPath);
        }

        FXMLLoader fxmlLoader = new FXMLLoader(fxmlLocation);
        return fxmlLoader.load();
    }

    static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    public static void main(String[] args) {
        launch();
    }

}
/*
Agregar botón agregar compra
Agregar caja
*/