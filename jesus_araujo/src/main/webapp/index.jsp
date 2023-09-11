<!DOCTYPE html>
<html>
<head>
    <title>Resgistar Cursos</title>
</head>
<body>
    <h1>Resgistar Cursos</h1>

    <!-- Formulario para agregar un nuevo elemento -->
    <h2>Agregar Nuevo Elemento</h2>
    <form id="addForm">
        <label for="codigo">Código:</label>
        <input type="text" id="codigo" required>
        <br>
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" required>
        <br>
        <label for="nivel">Nivel:</label>
        <input type="text" id="nivel" required>
        <br>
        <label for="profesor">Profesor:</label>
        <input type="text" id="profesor" required>
        <br>
        <button type="submit">Enviar datos</button>
    </form>

    <!-- Lista de elementos existentes -->
    <h2>Lista de Elementos</h2>
    <ul id="elementList"></ul>

    <script>
        // Array de objetos para almacenar elementos
        var elementos = [];

        // Función para agregar un nuevo elemento
        function agregarElemento(codigo, nombre, nivel, profesor) {
            elementos.push({ codigo, nombre, nivel, profesor });
        }

        // Función para mostrar la lista de elementos
        function mostrarElementos() {
            var elementList = document.getElementById("elementList");
            elementList.innerHTML = "";

            elementos.forEach(function(elemento, index) {
                var listItem = document.createElement("li");
                listItem.innerHTML = `Código: ${elemento.codigo}, Nombre: ${elemento.nombre}, Nivel: ${elemento.nivel}, Profesor: ${elemento.profesor}
                    <button onclick="editarElemento(${index})">Editar</button>
                    <button onclick="eliminarElemento(${index})">Eliminar</button>`;
                elementList.appendChild(listItem);
            });
        }

        // Función para editar un elemento
        function editarElemento(index) {
            var nuevoCodigo = prompt("Editar el código del elemento:", elementos[index].codigo);
            var nuevoNombre = prompt("Editar el nombre del elemento:", elementos[index].nombre);
            var nuevoNivel = prompt("Editar el nivel del elemento:", elementos[index].nivel);
            var nuevoProfesor = prompt("Editar el profesor del elemento:", elementos[index].profesor);

            if (nuevoCodigo !== null && nuevoNombre !== null && nuevoNivel !== null && nuevoProfesor !== null) {
                elementos[index].codigo = nuevoCodigo;
                elementos[index].nombre = nuevoNombre;
                elementos[index].nivel = nuevoNivel;
                elementos[index].profesor = nuevoProfesor;
                mostrarElementos();
            }
        }

        // Función para eliminar un elemento
        function eliminarElemento(index) {
            if (confirm("¿Seguro que quieres eliminar este elemento?")) {
                elementos.splice(index, 1);
                mostrarElementos();
            }
        }

        // Manejar el envío del formulario para agregar elementos
        var addForm = document.getElementById("addForm");
        addForm.addEventListener("submit", function(event) {
            event.preventDefault();
            var codigo = document.getElementById("codigo").value;
            var nombre = document.getElementById("nombre").value;
            var nivel = document.getElementById("nivel").value;
            var profesor = document.getElementById("profesor").value;
            agregarElemento(codigo, nombre, nivel, profesor);
            mostrarElementos();
            document.getElementById("codigo").value = "";
            document.getElementById("nombre").value = "";
            document.getElementById("nivel").value = "";
            document.getElementById("profesor").value = "";
        });

        // Mostrar la lista de elementos al cargar la página
        mostrarElementos();
    </script>
</body>
</html>
