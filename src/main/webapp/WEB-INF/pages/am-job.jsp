<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .flex-container {
            display: -webkit-flex;
            display: flex;
            -webkit-flex-flow: row wrap;
            flex-flow: row wrap;
            text-align: center;
        }

        .flex-container > * {
            padding: 15px;
            -webkit-flex: 1 100%;
            flex: 1 100%;
        }

        .article {
            text-align: left;
        }

        .aside {
            position: relative;
            float: left;
            width: 195px;
            top: 0px;
            bottom: 0px;
            background-color: #ebddca;
            height: 100vh;
        }

        header {
            background: black;
            color: white;
        }

        footer {
            background: #aaa;
            color: white;
        }

        .nav {
            background: #eee;
        }

        .nav ul {
            list-style-type: none;
            padding: 0;
        }

        .nav ul a {
            text-decoration: none;
        }

        @media all and (min-width: 768px) {
            .nav {
                text-align: left;
                -webkit-flex: 1 auto;
                flex: 1 auto;
                -webkit-order: 1;
                order: 1;
            }

            .article {
                -webkit-flex: 5 0px;
                flex: 5 0px;
                -webkit-order: 2;
                order: 2;
            }

            footer {
                -webkit-order: 3;
                order: 3;
            }
        }
    </style>


    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/three.js"/>"></script>
    <script src="<c:url value="/resources/js/STLLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/OrbitControls.js"/>"></script>

    <script>
        <%--Service coding--%>
        function sendParameters() {
            var parametersObj = {deviceId: "${deviceId}", operationId: "${operationId}", parameters: []};
            var parameters = [];
            <c:forEach var="parameter" items="${parameters}">
            parameters.push({
                id: "${parameter.id}", name: "", type: "value",
                value: document.getElementById("${parameter.id}").value, restAttributes: {}
            });
            <%--parametersObj.parameters["${parameter.id}"] = document.getElementById("${parameter.id}").value;--%>
            </c:forEach>
            parametersObj.parameters = parameters;
            var requestBody = JSON.stringify(parametersObj);
            $.ajax({
                type: 'POST',
                url: "${postUrl}",
                data: requestBody,
                success: function (data) {
                    alert('data: ' + data);
                },
                contentType: "application/json",
                dataType: 'json'
            });
        }
    </script>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>

<div class="flex-container">
    <header>
        <h1>Cyber Physical Manufacturing Cloud</h1>
    </header>

    <nav class="nav">
        <ul>
            <%--<li><a href="#">CPMC Services</a></li>--%>
            <li><a href="http://localhost:1080/am-broker/home.htm">Back to AM Broker</a></li>
        </ul>
    </nav>

    <article class="article" id="article"></article>

    <aside class="article">
        <h2 class="w3-center">Print Model Object</h2>
        <p>
        <h5>Operation Id: </h5>
        <input type="text" disabled="disabled" name="${operationId}" value="${operationId}" id="${operationId}"/>
        </p>
        <c:forEach var="parameter" items="${parameters}">
            <p>
            <h5>${parameter.name} (${parameter.type}) :</h5>
            <input type="text" name="${parameter.id}" id="${parameter.id}"/>
            </p>
        </c:forEach>

        <p>
            <input type="submit" value="Print" onclick="sendParameters()"/>
        </p>
    </aside>

    <footer>Copyright &copy; University of Arkansas</footer>
</div>

<script>
    /*GUI Coding*/
    var container, camera, scene, renderer, controls;

    init();
    animate();

    function init() {
        container = document.getElementById('article');

        camera = new THREE.PerspectiveCamera(35, window.innerWidth / window.innerHeight, 1, 2000);
        camera.position.set(0, 0, 50);

        scene = new THREE.Scene();

        // object
        var loader = new THREE.STLLoader();
        loader.load('<c:url value="/resources/models/dragon.stl"/>', function (geometry) {
//            var material = new THREE.MeshLambertMaterial({ambient: 0xFBB917, color: 0xf2f2f2});
            var material=new THREE.MeshLambertMaterial({color:0x909090, overdraw: 1, wireframe: false,
                shading:THREE.FlatShading, vertexColors: THREE.FaceColors});
            var mesh = new THREE.Mesh(geometry, material);
            scene.add(mesh);
        });


        // STL file to be loaded
        loader.load('<c:url value="/resources/models/dragon.stl"/>');

        // lights
        scene.add(new THREE.AmbientLight(0x736F6E));

        var directionalLight = new THREE.DirectionalLight(0xffffff, 1);
        directionalLight.position = camera.position;
        scene.add(directionalLight);

        // renderer

        renderer = new THREE.WebGLRenderer({antialias: true});
        renderer.setSize(window.innerWidth / 1.75, window.innerHeight / 1.75);

        container.appendChild(renderer.domElement);

        window.addEventListener('resize', onWindowResize, false);

        controls = new THREE.OrbitControls( camera, renderer.domElement );
        controls.addEventListener( 'change', render ); // remove when using animation loop
        // enable animation loop when using damping or autorotation
        //controls.enableDamping = true;
        //controls.dampingFactor = 0.25;
        controls.enableZoom = false;
    }

    function addLight(x, y, z, color, intensity) {
        var directionalLight = new THREE.DirectionalLight(color, intensity);
        directionalLight.position.set(x, y, z)
        scene.add(directionalLight);
    }

    function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth / 1.75, window.innerHeight / 1.75);
    }

    function animate() {
        requestAnimationFrame(animate);
        controls.update(); // required if controls.enableDamping = true, or if controls.autoRotate = true
        render();
    }

    function render() {
        renderer.render(scene, camera);
        renderer.setClearColor(0xf5f5f5, 1);
    }
</script>

</body>
</html>
