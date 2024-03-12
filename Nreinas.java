
/**
 *
 * @author irvin
 */
public class Nreinas {
    private static final int N = 9; // Tamaño del tablero

    // Función para imprimir el tablero
    private static void imprimirTablero(int[][] tablero) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                System.out.print(tablero[i][j] + " ");
            }
            System.out.println();
        }
    }

    // Función para verificar si es seguro colocar una reina en la posición actual
    private static boolean esSeguro(int[][] tablero, int fila, int columna) {
        // Verificar la fila
        for (int i = 0; i < columna; i++) {
            if (tablero[fila][i] == 1) {
                return false;
            }
        }

        // Verificar la diagonal superior izquierda
        for (int i = fila, j = columna; i >= 0 && j >= 0; i--, j--) {
            if (tablero[i][j] == 1) {
                return false;
            }
        }

        // Verificar la diagonal inferior izquierda
        for (int i = fila, j = columna; i < N && j >= 0; i++, j--) {
            if (tablero[i][j] == 1) {
                return false;
            }
        }

        return true;
    }

    // Función recursiva para resolver el problema
    private static boolean resolver(int[][] tablero, int columna) {
        // Caso base: si todas las reinas están colocadas
        if (columna >= N) {
            return true;
        }

        // Intentar colocar una reina en cada fila de la columna actual
        for (int i = 0; i < N; i++) {
            if (esSeguro(tablero, i, columna)) {
                tablero[i][columna] = 1; // Colocar la reina

                // Llamada recursiva para la siguiente columna
                if (resolver(tablero, columna + 1)) {
                    return true;
                }

                // Si la colocación actual no lleva a una solución, retroceder
                tablero[i][columna] = 0;
            }
        }

        // No se encontró una solución en esta rama
        return false;
    }

    public static void main(String[] args) {
        int[][] tablero = new int[N][N];

        // Llamar a la función resolver con la columna inicial (0)
        if (resolver(tablero, 0)) {
            System.out.println("Solución encontrada:");
            imprimirTablero(tablero);
        } else {
            System.out.println("No se encontró solución.");
        }
    }
}
