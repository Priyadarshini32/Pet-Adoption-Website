<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Breeds</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        h1 {
            color: #009688;
            text-align: center;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #4CAF50;
        }

        ol {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        ol li {
            display: inline-block;
            width: 30%;
            margin: 10px 1%;
            text-align: center;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 5px 6px rgba(0, 0, 0, 0.1);
        }

        ol li img {
            display: block;
            margin: 10px auto 2px;
            border-radius: 1px;
            width: 180px;
            height: 180px;
        }

        ol li a {
            display: block;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 15px;
        }

        ol li a:hover {
            text-decoration: underline;
        }

        .breed-card {
            display: inline-block;
            width: 30%;
            margin: 10px 1% 10px 3%; /* Adjusted left margin to 2% */
            text-align: center;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 5px 6px rgba(0, 0, 0, 0.1);
        }

        .breed-card img {
            display: block;
            margin: 15px auto 2px;
            border-radius: 1px;
            width: 180px;
            height: 180px;
        }
		.breed-card a{
		            display: block;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px;
		}
        .breed-card h2 {
            text-align: center;
            margin-top: 30px;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <h1>Available Breeds for Adoption:</h1>
    
    <% String category = request.getParameter("category"); %>
    <% if ("cats".equals(category)) { %>
        <h2 style="text-align: center; color: #FF5733;">Cat Breeds:</h2>
        <ol>
            <li><img src="${pageContext.request.contextPath}/cats/American-Bobtail1.jpg" alt="American Bobtail" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=american_bobtail">American Bobtail</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/cats/bengal-cat.jpg" alt="Bengal Cat" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=bengal_cat">Bengal Cat</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/cats/egyptian-mau.jpg" alt="Egyptian Mau" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=egyptian_mau">Egyptian Mau</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/cats/Maine-Coon.jpg" alt="Maine Coon" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=maine_coon">Maine Coon</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/cats/persian-cat.jpg" alt="Persian Cat" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=persian_cat">Persian Cat</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/cats/Scottish-Fold.jpg" alt="Scottish Fold" width="150px"><br>
                <a href="breed.jsp?category=cats&breed=scottish_fold">Scottish Fold</a>
            </li>
        </ol>
    <% } else if ("dogs".equals(category)) { %>
        <h2 style="text-align: center; color: #FFC300;">Dog Breeds:</h2>
        <ol>
            <li><img src="${pageContext.request.contextPath}/dogs/alaskan-malamute.jpg" alt="Alaskan Malamute" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=alaskan_malamute">Alaskan Malamute</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/dogs/aussie-bulldog-thumb.jpg" alt="Aussie Bulldog" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=aussie_bulldog">Aussie Bulldog</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/dogs/basset-hound.jpg" alt="Basset Hound" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=basset_hound">Basset Hound</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/dogs/german-shepherd.jpg" alt="German Shepherd" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=german_shepherd">German Shepherd</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/dogs/golden-retriever.jpg" alt="Golden Retriever" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=golden_retriever">Golden Retriever</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/dogs/rottweiler.jpg" alt="Rottweiler" width="150px"><br>
                <a href="breed.jsp?category=dogs&breed=rottweiler">Rottweiler</a>
            </li>
        </ol>
    <% } else if ("birds".equals(category)) { %>
        <h2 style="text-align: center; color: #3498DB;">Bird Breeds:</h2>
        <ol>
            <li><img src="${pageContext.request.contextPath}/birds/Budgerigar.jpg" alt="Budgerigar" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=budgerigar">Budgerigar</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/birds/Cockatiel.jpg" alt="Cockatiel" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=cockatiel">Cockatiel</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/birds/cockatto.jpg" alt="Cockatoo" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=cockatoo">Cockatoo</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/birds/Dove.jpg" alt="Dove" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=dove">Dove</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/birds/golden-canary.jpg" alt="Golden Canary" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=golden_canary">Golden Canary</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/birds/hyacinth-macaw.jpg" alt="Hyacinth Macaw" width="150px"><br>
                <a href="breed.jsp?category=birds&breed=hyacinth_macaw">Hyacinth Macaw</a>
            </li>
        </ol>
    <% } else if ("rabbits".equals(category)) { %>
        <h2 style="text-align: center; color: #9B59B6;">Rabbit Breeds:</h2>
        <ol>
            <li><img src="${pageContext.request.contextPath}/rabbits/Lionhead_rabbit_Dobby.jpg" alt="Lionhead" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=lionhead">Lionhead</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/rabbits/Flemish Giant.jpg" alt="Flemish Giant" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=flemish_giant">Flemish Giant</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/rabbits/Rex.jpg" alt="Rex" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=rex">Rex</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/rabbits/angora.jpg" alt="Angora" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=angora">Angora</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/rabbits/Netherlands_Dwarf_Rabbit.jpg" alt="Netherland Dwarf" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=netherland_dwarf">Netherland Dwarf</a>
            </li>
            <li><img src="${pageContext.request.contextPath}/rabbits/Holland_lop.jpg" alt="Holland Lop" width="150px"><br>
                <a href="breed.jsp?category=rabbits&breed=holland_lop">Holland Lop</a>
            </li>
        </ol>
    <% } %>

    <%
        String breedName = (String) request.getAttribute("breedName");
        String imagePath = (String) request.getAttribute("imagePath");
        String newCategory = (String) request.getAttribute("category");

        if (breedName != null && imagePath != null && newCategory != null) {
    %>
        <div class="breed-card">
            <img src="<%= imagePath %>" alt="<%= breedName %>" width="150px"><br>
            <a href="breed.jsp?breed=<%= breedName %>&category=<%= newCategory %>"><%= breedName %></a>
        </div>
    <% } %>

    <script>
        // Add event listener to breed link to toggle clicked class
        document.querySelectorAll('.breed-link').forEach(function(link) {
            link.addEventListener('click', function() {
                this.classList.toggle('clicked');
            });
        });
    </script>
</body>
</html>
