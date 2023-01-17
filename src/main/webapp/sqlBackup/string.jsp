<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Strings</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/time.js"></script>        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $('form input').on('change', function () {
                $(this).closest('form').submit();
            });
        </script>
    </head>

    <body onload="startTime()">
        <header>           
            <div class="Navbar">                
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Java String</h1>
                <nav>
                    <ul class="nav">
                        <li><a class="button" href="index.jsp"> Home </a></li>                                      
                    </ul>
                </nav>
            </div>          
        </header>

        <main>
            <article>
                <div class="content">                    
                    <form method="POST" action="string.jsp">
                        <input id="S" type="text" name="S" placeholder="String" autofocus>  
                    </form>
                    <jsp:include page="vowel.jsp" flush="true"/>                   
                </div>
            </article>
        </main>

        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>