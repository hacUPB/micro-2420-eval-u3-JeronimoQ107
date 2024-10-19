[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tn5SB-Yw)
# Unidad 3
## Documentación del Proyecto
 
Nombre del estudiante: Jerónimo Quintero Chavarría  
ID: 000492388

---
## Actividad 1

### Ejercicio 1

---

**¿Cuáles son los lenguajes en los que se puede programar sistemas embebidos y qué ventajas y desventajas tienen dichos lenguajes comparados con C?**

- **C:** Es el lenguaje más utilizado en programación de sistemas embebidos debido a su eficiencia y control a bajo nivel. Permite manipular directamente hardware y optimizar el uso de recursos.

- **C++:** Aunque es más pesado que C, C++ ofrece características de programación orientada a objetos, lo que puede facilitar la gestión de proyectos más complejos y la reutilización de código.

- **Assembly:** Proporciona un control total sobre el hardware, permitiendo la programación a nivel de instrucción. Es ideal para aplicaciones donde el rendimiento y la optimización son críticos, aunque es más complejo y menos portable.

- **Python:** Aunque no es típico para sistemas embebidos debido a su overhead, con plataformas como MicroPython o CircuitPython, se puede usar para prototipos rápidos y aplicaciones menos críticas.

- **Java:** Utilizado principalmente en sistemas embebidos que requieren portabilidad, como dispositivos móviles y algunos dispositivos IoT. Sin embargo, no es tan común como C o C++ en entornos con recursos limitados.

- **Rust:** Un lenguaje más reciente que proporciona seguridad en la gestión de memoria y concurrencia sin sacrificar el rendimiento, haciéndolo atractivo para sistemas embebidos modernos.

- **Ada:** Utilizado en sistemas críticos (como aeronáutica y defensa) por su robustez y características de programación segura. Es menos común, pero muy valorado en entornos donde la fiabilidad es clave.

- **Verilog/VHDL:** Lenguajes de descripción de hardware utilizados para diseñar circuitos integrados y FPGA. Permiten definir la estructura y el comportamiento del hardware.

- **Lua:** Utilizado en sistemas embebidos para la programación de scripts y en dispositivos como routers y sistemas de domótica. Es ligero y fácil de integrar.


**¿Existe un ranking de lenguajes para sistemas embebidos?** 

Sí, existen rankings que evalúan la popularidad y relevancia de los lenguajes de programación en el ámbito de los sistemas embebidos. Maven Silicon ha hecho una lista en donde evalúa 5 lenguajes de programación enfocados en los sistemas embebidos. Como es lógico, C se sitúa como el lenguaje éstandar. Python, Rust, C++ y Assembly son los otros lenguajes que la página considera como los más útiles.

En la categoría de sistemas embebidos, los lenguajes que tradicionalmente han ocupado posiciones destacadas incluyen C, C++, Python y Java. C y C++ son valorados por su eficiencia y control de bajo nivel, esenciales en dispositivos con recursos limitados. Python, aunque es un lenguaje de alto nivel, ha ganado terreno en sistemas embebidos debido a su facilidad de uso y la disponibilidad de bibliotecas específicas. 

[Top 5 Best Programming Languages for Embedded Systems](https://www.maven-silicon.com/blog/top-5-best-programming-languages-for-embedded-systems/)

### Ejercicio 2

---

Crear tres macros en C

1. Aplicar una máscara para escribir en un registro del microcontrolador
~~~c
#define MASK_OR_REG(reg, mask) ((reg) |= (mask))
~~~

2. Determinar si un periférico está presente en el microprocesador
~~~c
#define VER_PERI(PCC) ((PCC) & (1 << 31)) 
~~~

3. Alternar un bit de un registro
~~~c
#define TOGGLE_BIT(reg, bit) ((reg) ^= (1 << (bit)))
~~~

### Ejercicio 3

---

En el siguiente ejercicio se identifican errores comunes que pueden ocurrir si no se utilizan los tipos de datos correctos o la sintaxis adecuada. 

~~~c
#include <stdio.h>
#include <string.h>

int main() {
    // Datos enteros
    int entero = 10.5;  
    printf("El valor del entero es: %d\n", entero);  

    // Datos float
    float decimal = 3 / 2;  
    printf("El valor del decimal es: %f\n", decimal);  
    float decimal_1 = 12.5 * 5;  
    printf("El valor del decimal es: %d\n", decimal_1);  

    // Caracteres
    char letra = "A";  
    printf("El valor del caracter es: %c\n", letra);

    // Cadenas de caracteres
    char nombre[5];  
    strcpy(nombre, "Henry");  
    printf("El nombre es: %s\n", nombre);

    return 0;
}
~~~

Existen 5 errores importantes en el código anterior.

- **Asignación de número flotante a entero:**

---

~~~c
int entero = 10.5;
~~~

En este caso se está asignando un número decimal a una variable de tipo int. Esto genera una conversión implícita, lo que ocasiona que se pierda la parte decimal.
La forma de solucionar esto es asignar un valor entero o cambiar el tipo de variable a float o double.

~~~c
//  Solución
int entero = 10;
~~~

- **División entera en flotante:**

---

~~~c
float decimal = 3 / 2;
~~~

La operación $3 / 2$ es una división entera, por lo que el resultado será 1, no 1.5.
La solución consiste en cambiar uno de los operandos a float, por ejemplo: $3.0 / 2$ o $3 / 2.0$.

~~~c
//  Solución
float decimal = 3.0 / 2;
~~~

- **Impresión incorrecta de float:**

---

~~~c
float decimal_1 = 12.5 * 5;
printf("El valor del decimal es: %d\n", decimal_1);
~~~

Se está utilizando **%d** para imprimir una variable de tipo float (decimal_1), lo que es incorrecto. Cambiar el formato a **%f** para imprimir flotantes debería ser suficiente para solucionar este problema.

~~~c
//  Solución
float decimal_1 = 12.5 * 5;
printf("El valor del decimal es: %f\n", decimal_1);
~~~

- **Asignación de carácter con comillas dobles:**

---

~~~c
char letra = "A";
~~~

**"A"** es una cadena de caracteres, no un carácter. Para un char se deben usar comillas simples.

~~~c
//  Solución
char letra = 'A';
~~~

- **Tamaño insuficiente del arreglo de caracteres:**

---

~~~c
char nombre[5];
strcpy(nombre, "Henry");
~~~

El tamaño del arreglo nombre es insuficiente, ya que "Henry" tiene 5 caracteres más el carácter nulo (\0), lo que requiere un arreglo de tamaño 6.

~~~c
//  Solución
char nombre[6];
~~~


El código corregido es el siguiente:

~~~c
#include <stdio.h>
#include <string.h>

int main() {
    // Datos enteros
    int entero = 10;  // Asignar un valor entero
    printf("El valor del entero es: %d\n", entero);  

    // Datos float
    float decimal = 3.0 / 2;  // Realizar división flotante
    printf("El valor del decimal es: %f\n", decimal);  
    float decimal_1 = 12.5 * 5;
    printf("El valor del decimal es: %f\n", decimal_1);  // Usar %f

    // Caracteres
    char letra = 'A';  // Usar comillas simples para caracteres
    printf("El valor del caracter es: %c\n", letra);

    // Cadenas de caracteres
    char nombre[6];  // Aumentar el tamaño del arreglo
    strcpy(nombre, "Henry");
    printf("El nombre es: %s\n", nombre);

    return 0;
}
~~~


### Ejercicio 4

---

De manera similar a como se hizo en el ejercicio anterior, en este ejercicio se identifican errores comunes que pueden ocurrir relacionados con bucles infinitos, accesos inválidos a memoria, o condiciones incorrectas.

~~~c
#include <stdio.h>

int main() {
    int i;
    int num = 10;
    int array[5] = {1, 2, 3, 4, 5};
    int contador = 0;

    for (i = 1; i < 10; i--) {
        printf("Valor de i: %d\n", i);
    }

    for (i = 0; i <= 5; i++) {
        printf("Elemento del array: %d\n", array[i]);
    }

    while (num != 0) {
        printf("Valor de num: %d\n", num);
        num = num + 1;  
    }

    while (contador < 5) {
        printf("Valor de contador: %d\n", contador);
    }

    return 0;
}
~~~

- **Bucle infinito en el primer for:**

---

~~~c
for (i = 1; i < 10; i--) {
    printf("Valor de i: %d\n", i);
}
~~~

El bucle está configurado para que i decremente (i--), pero la condición es que i sea menor que 10. Esto provoca un bucle infinito porque i sigue disminuyendo y nunca llega a ser mayor o igual a 10.
La forma de solucionar esto es cambiar el decremento a incremento (i++) o ajustar la condición según la lógica deseada.

~~~c
//  Solución
for (i = 1; i < 10; i++) {
    printf("Valor de i: %d\n", i);
}
~~~

- **Acceso fuera de límites del array:**

---

~~~c
for (i = 0; i <= 5; i++) {
    printf("Elemento del array: %d\n", array[i]);
}
~~~

El bucle intenta acceder al índice array[5], pero el array tiene índices de 0 a 4. Acceder al índice 5 produce comportamiento indefinido.
Cambiar la condición del bucle para que no intente acceder a índices fuera del rango puede ser una posible solución.

~~~c
//  Solución
for (i = 0; i < 5; i++) {
    printf("Elemento del array: %d\n", array[i]);
}
~~~

- **Bucle infinito en el primer while:**

---

~~~c
while (num != 0) {
    printf("Valor de num: %d\n", num);
    num = num + 1;  
}
~~~

La variable num se incrementa en cada iteración, lo que significa que nunca alcanzará el valor 0, provocando un bucle infinito. La solución consiste en modificar la operación para que num decremente y eventualmente llegue a 0.

~~~c
//  Solución
while (num != 0) {
    printf("Valor de num: %d\n", num);
    num = num - 1;  
}
~~~

- **Bucle infinito en el segundo while:**

---


~~~c
while (contador < 5) {
    printf("Valor de contador: %d\n", contador);
}
~~~

El valor de contador nunca cambia dentro del bucle, lo que provoca un bucle infinito.Hay que asegurarse de incrementar el contador dentro del bucle para que eventualmente salga.

~~~c
//  Solución
while (contador < 5) {
    printf("Valor de contador: %d\n", contador);
    contador++;
}
~~~

El código corregido es:

~~~c
#include <stdio.h>

int main() {
    int i;
    int num = 10;
    int array[5] = {1, 2, 3, 4, 5};
    int contador = 0;

    for (i = 1; i < 10; i++) {
        printf("Valor de i: %d\n", i);
    }

    for (i = 0; i < 5; i++) {
        printf("Elemento del array: %d\n", array[i]);
    }

    while (num != 0) {
    printf("Valor de num: %d\n", num);
    num = num - 1;  
    }

    while (contador < 5) {
    printf("Valor de contador: %d\n", contador);
    contador++;
    }

    return 0;
}
~~~

### Ejercicio SDK

---

Se implementó el ejemplo led_blinky del SDK y se modificó para poder encender un LED empleando un puerto diferente al utilizado en el ejemplo (PTE9).

Para poder hacer esto, se cambió el puerto E9 por el puerto B12: se cambia *BOARD_INITPINS_LED_RED_GPIO* que era antes *GPIOE* por *GPIOB* y se cambia *BOARD_INITPINS_LED_RED_PORT* que era antes *PORTE* por *PORTB*, además se cambió *BOARD_INITPINS_LED_RED_PIN* que era antes *9U* por *12U*. Todo esto se hace mediante la función <span style="background-color: rgba(0, 0, 0, 0.3); color: white; padding: 2px 5px; border-radius: 3px;">BOARD_InitPins()</span>;

En el clock control (línea 66 de pin.mux.c) se cambió *CLOCK_EnableClock(kCLOCK_PortE)* por *CLOCK_EnableClock(kCLOCK_PortB)*.

Adicionalmente a modo de experimento se cambió el funcionamiento del programa: la idea es que el LED se encienda durante 3 segundos y luego esté apagado durante 1 segundo, esto se logra modificando la función <span style="background-color: rgba(0, 0, 0, 0.3); color: white; padding: 2px 5px; border-radius: 3px;">int main(void)</span> tal como se muestra a continuación:

~~~c
int main(void)
{
    /* Board pin init */
    BOARD_InitPins();
    BOARD_InitBootClocks();

    /* Set systick reload value to generate 1ms interrupt */
    if (SysTick_Config(SystemCoreClock / 1000U))
    {
        while (1)
        {
        }
    }

    while (1)
    {
        /* Encender el LED */
        GPIO_PortSet(BOARD_LED_GPIO, 1u << BOARD_LED_GPIO_PIN);
        /* Mantener encendido durante 3 segundos (3000 ms) */
        SysTick_DelayTicks(3000U);

        /* Apagar el LED */
        GPIO_PortClear(BOARD_LED_GPIO, 1u << BOARD_LED_GPIO_PIN);
        /* Mantener apagado durante 1 segundo (1000 ms) */
        SysTick_DelayTicks(1000U);
    }
}

~~~

## Proyecto - Encendido de un LED usando un teclado 4x4

Se usará el microcontrolador para controlar la intensidad de un LED mediante un teclado matricial y una señal PWM. Se implementa la técnica de multiplexación para leer el teclado, una máquina de estados finitos para gestionar el flujo del programa, y el PWM del módulo FTM (FlexTimer Module) para variar el brillo del LED en función del ciclo útil, que el usuario puede ser ajustado ingresando valores entre 1% y 99%.

### Diagrama de estados

---

Se diseño el diagrama de estados en base a una máquina de Mealy que posee 3 estados: <span style="background-color: rgba(0, 0, 0, 0.3); color: white; padding: 2px 5px; border-radius: 3px;">ESTADO INICIAL</span>, <span style="background-color: rgba(0, 0, 0, 0.3); color: white; padding: 2px 5px; border-radius: 3px;">PWM ACTIVADO</span> Y <span style="background-color: rgba(0, 0, 0, 0.3); color: white; padding: 2px 5px; border-radius: 3px;">AJUSTE PWM</span>.

<div align="center">
    <img src="./IMG/DiagramaEstados.svg" alt="imagen leds" />
</div>

**Funcionamiento**

**Estados:**

- **Estado Inicial:** Aquí el sistema está esperando una entrada del usuario. El LED está apagado y el PWM no está activo.

  **Transición:**
  - Si se presiona una tecla diferente de 'A', el sistema permanece en el estado inicial. La salida es el ciclo útil del PWM, que en este caso es 0.
  - Si se presiona 'A', el sistema pasa al estado de PWM Activado. La salida es 0.

- **PWM Activado:** En este estado, el PWM está funcionando, y el LED varía su intensidad según el ciclo útil actual $X_n$

  **Transición:**
  - Presionar la tecla 'B' regresa al estado Inicial y el PWM se apaga. La salida es 0.
  - Presionar un nuevo numero, es decir, definir un nuevo ciclo útil $X_{n+1}$, ocasiona que se pase al estado Ajuste PWM. La salida es el ciclo útil actual $X_n$.
  - Presionar 'A', 'C' o 'D' en este estado no cambia nada, se queda en PWM Activado con el mismo ciclo útil. La salida es el ciclo útil actual $X_n$.

- **Ajuste PWM:** Aquí el usuario puede ajustar el ciclo útil del PWM para controlar la intensidad del LED.

  **Transición:**
  - Presionar 'D' confirma el nuevo ciclo útil $X_{n+1}$ y vuelve al estado PWM Activado. La salida es el nuevo ciclo útil $X_{n+1}$.
  - Presionar 'C' descarta el cambio y mantiene el ciclo actual $X_n$, regresando también a PWM Activado. La salida es el ciclo útil actual $X_n$.
  - Si se presiona 'A' o se ingresa el nuevo ciclo útil $X_{n+1}$, el sistema vuelve al estado Ajuste PWM para seguir haciendo cambios. La salida es el ciclo útil actual $X_n$.
  - Presionar 'B' apaga el PWM y regresa al estado Inicial. La salida es 0.

### Código y explicación

---

Dentro del repositorio se incluye una carpeta llamada "twrke18fProject3_ftm_simple_pwm" que contiene todo el programa de este proyecto. Cabe aclarar que se trabajó sobre el ejemplo ftm_simple_pwm del SDK para una mayor eficiencia, además, se empleó el uso del apartado **PINS** de MCUXpresso para realizar la configuración del GPIO de los pines del teclado matricial y el PWM.

Para la multiplexación del teclado matricial, se decidió utilizar los pines 13-16 del puerto D para las columnas, que en este caso son las entradas del sistema, además, se tuvieron que habilitar tanto las resistencias de pull up como los pull enable desde el mismo apartado de **PINS**.
Por otro lado, las filas fueron configuradas como las salidas del sistema usando los pines 12-15 del puerto C.

Para el PWM se decidió utilizar el pin 11 del puerto C que fue configurado con el modo de funcionamiento **ALT2** que corresponde al FTM3_Chnl5 del módulo FlexTimer.

A continuación se hace un desglose de todas las funciones del programa para poder entender el funcionamiento del programa.






