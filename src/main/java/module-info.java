module com.mistressoles {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql; // Importante para SQLite

    opens com.mistressoles.controller to javafx.fxml;
    opens com.mistressoles.modelos to javafx.base; // Para que la tabla lea Producto.java

    exports com.mistressoles;
}