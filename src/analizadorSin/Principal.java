/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorSin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author carlos
 */
public class Principal {
    public static void main(String[] args) throws IOException, Exception {
        String ruta1 = "/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/lexer.flex";
        String ruta2 = "/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/lexerCup.flex";
        String[] rutaS = {"-parser", "sintax", "/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception {
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
         Files.move(
                Paths.get("/home/carlos/Documents/compiladores/analizadorSin/sym.java"), 
                Paths.get("/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/sym.java")
        );
        Path rutaSin = Paths.get("/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("/home/carlos/Documents/compiladores/analizadorSin/sintax.java"), 
                Paths.get("/home/carlos/Documents/compiladores/analizadorSin/src/analizadorSin/sintax.java")
        );
    }
}
