[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tn5SB-Yw)
# Unidad 3
## Documentación del Proyecto
 
Nombre del estudiante: Jerónimo Quintero Chavarría  
ID: 000492388

---
## Actividad 1

### Ejercicio 1

¿Cuáles son los lenguajes en los que se puede programar sistemas embebidos y qué ventajas y desventajas tienen dichos lenguajes comparados con C?

- **C:** Es el lenguaje más utilizado en programación de sistemas embebidos debido a su eficiencia y control a bajo nivel. Permite manipular directamente hardware y optimizar el uso de recursos.

- **C++:** Aunque es más pesado que C, C++ ofrece características de programación orientada a objetos, lo que puede facilitar la gestión de proyectos más complejos y la reutilización de código.

- **Assembly:** Proporciona un control total sobre el hardware, permitiendo la programación a nivel de instrucción. Es ideal para aplicaciones donde el rendimiento y la optimización son críticos, aunque es más complejo y menos portable.

- **Python:** Aunque no es típico para sistemas embebidos debido a su overhead, con plataformas como MicroPython o CircuitPython, se puede usar para prototipos rápidos y aplicaciones menos críticas.

- **Java:** Utilizado principalmente en sistemas embebidos que requieren portabilidad, como dispositivos móviles y algunos dispositivos IoT. Sin embargo, no es tan común como C o C++ en entornos con recursos limitados.

- **Rust:** Un lenguaje más reciente que proporciona seguridad en la gestión de memoria y concurrencia sin sacrificar el rendimiento, haciéndolo atractivo para sistemas embebidos modernos.

- **Ada:** Utilizado en sistemas críticos (como aeronáutica y defensa) por su robustez y características de programación segura. Es menos común, pero muy valorado en entornos donde la fiabilidad es clave.

- **Verilog/VHDL:** Lenguajes de descripción de hardware utilizados para diseñar circuitos integrados y FPGA. Permiten definir la estructura y el comportamiento del hardware.

- **Lua:** Utilizado en sistemas embebidos para la programación de scripts y en dispositivos como routers y sistemas de domótica. Es ligero y fácil de integrar.

**FALTA**

---
### Ejercicio 2

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
---

### Ejercicio 3