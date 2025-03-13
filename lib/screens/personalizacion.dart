import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Personalizacion extends StatefulWidget {
  const Personalizacion({super.key});

  @override
  State<Personalizacion> createState() => _PersonalizacionState();
}

class _PersonalizacionState extends State<Personalizacion> {
  Color selectedColor = Colors.red;
  double opacity = 0.8;
  int selectedEffect = 0;
  int apagadoEn = 10;
  TimeOfDay apagadoALas = TimeOfDay.now();

  List<Color> presetColors = [
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.yellow
  ];

  List<Color> customColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LightStep'),
        titleTextStyle: TextStyle(fontSize: 42, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 73, 19, 79),
      ),
      body: Container(
        color: const Color.fromARGB(255, 73, 19, 79),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selecciona un color',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),

              // Contenedor principal con fondo opaco y bordes redondeados
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Círculo RGB más grande y centrado
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          Color? pickedColor = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Selecciona un color'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: selectedColor,
                                    onColorChanged: (color) {
                                      setState(() => selectedColor = color);
                                    },
                                    pickerAreaHeightPercent: 0.7,
                                    enableAlpha: false,
                                    displayThumbColor: true,
                                    paletteType: PaletteType.hsvWithHue,
                                    labelTypes: [],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cerrar'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (pickedColor != null) {
                            setState(() {
                              selectedColor = pickedColor;
                            });
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(125),
                            border: Border.all(
                              color: selectedColor,
                              width: 5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'RGB\n${selectedColor.red}, ${selectedColor.green}, ${selectedColor.blue}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedColor.computeLuminance() > 0.5
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Primera hilera de 4 colores predefinidos con tamaño pequeño
                    Text('Colores Estándar',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(presetColors.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = presetColors[index];
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: presetColors[index],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),

                    // Segunda hilera de colores personalizables (más pequeños)
                    Text('Colores Personalizados',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(customColors.length, (index) {
                        return GestureDetector(
                          onTap: () async {
                            Color? pickedColor = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Selecciona un color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: customColors[index],
                                      onColorChanged: (color) {
                                        setState(
                                            () => customColors[index] = color);
                                      },
                                      pickerAreaHeightPercent: 0.7,
                                      enableAlpha: false,
                                      displayThumbColor: true,
                                      paletteType: PaletteType.hsvWithHue,
                                      labelTypes: [],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (pickedColor != null) {
                              setState(() {
                                customColors[index] = pickedColor;
                              });
                            }
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: customColors[index],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10),

                    // Botones de cancelar y aplicar con bordes degradados
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.purpleAccent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Aplicar',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.purpleAccent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              // Efectos
              _bordeConGradienteTexto('Efectos'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _efectoBoton(0, 'Estático', Colors.purple, Colors.purple,
                      Colors.pink), // Estático
                  _efectoBoton(1, 'Ciclo', Colors.purple, Colors.purple,
                      Colors.pink), // 3 colores para ciclo
                  _efectoBoton(2, 'Arcoíris', Colors.purple, Colors.purple,
                      Colors.pink, Colors.pink), // 4 colores para arco iris
                ],
              ),

              SizedBox(height: 20),

              // Opacidad
              _bordeConGradienteTexto('Opacidad'),
              Slider(
                value: opacity,
                min: 0,
                max: 1,
                divisions: 10,
                label: (opacity * 100).toInt().toString() + '%',
                onChanged: (val) => setState(() => opacity = val),
              ),

              SizedBox(height: 20),

              // Tiempo de Apagado
              _bordeConGradienteTexto('Tiempo de Apagado'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => setState(
                        () => apagadoEn = (apagadoEn - 5).clamp(0, 120)),
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                  Text('$apagadoEn minutos',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  IconButton(
                    onPressed: () => setState(
                        () => apagadoEn = (apagadoEn + 5).clamp(0, 120)),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: apagadoALas,
                    );
                    if (picked != null) setState(() => apagadoALas = picked);
                  },
                  child: Text('Apagar a las: ${apagadoALas.format(context)}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _efectoBoton(int index, String label, Color startColor,
      [Color? midColor, Color? endColor, Color? additionalColor]) {
    bool isSelected = selectedEffect == index;

    // Asignamos los colores dependiendo de si es 3 o 4 colores
    List<Color> gradientColors = [];
    if (midColor != null && endColor != null) {
      gradientColors = [startColor, midColor, endColor];
    } else if (additionalColor != null) {
      gradientColors = [startColor, midColor!, endColor!, additionalColor];
    } else {
      gradientColors = [startColor];
    }

    return GestureDetector(
      onTap: () => setState(() => selectedEffect = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: gradientColors,
                )
              : null,
          color: isSelected ? null : Colors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _bordeConGradienteTexto(String texto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.purpleAccent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
