<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <title>Example 08.09 - Load stl model </title>
    <script src="<c:url value="/resources/js/three.js"/>"></script>
    <script src="<c:url value="/resources/js/STLLoader.js"/>"></script>

    <script src="<c:url value="/resources/js/stats.min.js"/>"></script>
    <script src="<c:url value="/resources/js/dat.gui.min.js"/>"></script>

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
            width: 50px;
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
</head>
<body>

<%--
<div id="Stats-output">
</div>
<!-- Div which will hold the Output -->
<div id="WebGL-output">
</div>
--%>

<div class="flex-container">
    <header>
        <h1>Cyber Physical Manufacturing Cloud</h1>
    </header>

    <nav class="nav">
        <ul>
            <li><a href="#">CPMC Services</a></li>
            <li><a href="#">Additive Manufacturing Broker</a></li>
        </ul>
    </nav>

    <article class="article" id="article">
        <p>
            Article
        </p>
    </article>

    <aside class="article">
        <h3>Test</h3>
        <p>
            Aside
        </p>
    </aside>

    <footer>Copyright &copy; University of Arkansas</footer>
</div>

<!-- Javascript code that runs our Three.js examples -->
<script>
    var container, camera, scene, renderer;

    init();
    animate();

    function init() {
        container = document.getElementById('article');

        camera = new THREE.PerspectiveCamera(35, window.innerWidth / window.innerHeight, 1, 10000);
        camera.position.set(3, 0.5, 3);

        scene = new THREE.Scene();

        // object
        var loader = new THREE.STLLoader();
        loader.load('<c:url value="/resources/models/dragon.stl"/>', function (geometry) {
            var material = new THREE.MeshLambertMaterial({ambient: 0xFBB917, color: 0xfdd017});
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
        renderer.setSize(window.innerWidth/1.75, window.innerHeight/1.75);

        container.appendChild(renderer.domElement);

        window.addEventListener('resize', onWindowResize, false);
    }

    function addLight(x, y, z, color, intensity) {
        var directionalLight = new THREE.DirectionalLight(color, intensity);
        directionalLight.position.set(x, y, z)
        scene.add(directionalLight);
    }

    function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth/1.75, window.innerHeight/1.75);
    }

    function animate() {
        requestAnimationFrame(animate);
        render();
    }

    function render() {
        var timer = Date.now() * 0.0005;
        r = 150;
        camera.position.x = r * Math.sin(timer);
        camera.position.z = r * Math.cos(timer);
        camera.lookAt(scene.position);
        renderer.render(scene, camera);
        renderer.setClearColor(0xf5f5f5, 1);
    }
</script>

</body>
</html>