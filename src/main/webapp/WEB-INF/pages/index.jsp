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
        <h3>CPMC Services Thumbnails willl be here</h3>
        <p>
            Test article
        </p>
    </article>

    <aside class="article">
        <h3>Test aside</h3>
        <p>
            Test aside
        </p>
    </aside>

    <footer>Copyright &copy; University of Arkansas</footer>
</div>

</body>
</html>
