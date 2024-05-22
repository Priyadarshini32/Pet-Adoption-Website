<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Homepage</title>
    <style>
        /* CSS for image sizing */
        .pet-image {
            width: 200px; /* Adjust as needed */
            height: 150px; /* Adjust as needed */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin: 0 10px 20px 10px; /* Spacing between images */
            border: 2px solid #ddd; /* Border */
        }
        .category-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
        }
        .category-item {
            flex-basis: calc(50% - 20px); /* Adjust as needed */
            text-align: center; /* Center content inside each category item */
        }
        h1 {
            color: #009688; /* Text color for welcome message */
            text-align: center; /* Center welcome message */
        }
        h4 {
            font-size: 24px; /* Larger text size for category headings */
        }
        .crud-section {
            text-align: center;
            margin-top: 40px;
        }
        .crud-section h2 {
            color: #009688;
            margin-bottom: 20px;
        }
        .crud-section button {
            width: 200px;
            padding: 10px;
            margin: 10px;
            background-color: #4CAF50; /* New color for buttons */
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .crud-section button:hover {
            background-color: #45a049; /* Darker color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Pet Adoption Website!</h1>

        <div class="category-container">
            <!-- Cats -->
            <div class="category-item">
                <h4>Cats:</h4>
                <a href="category.jsp?category=cats">
                    <img src="${pageContext.request.contextPath}/images/cat.jpg" alt="Cat Image" class="pet-image">
                </a>
            </div>

            <!-- Dogs -->
            <div class="category-item">
                <h4>Dogs:</h4>
                <a href="category.jsp?category=dogs">
                    <img src="${pageContext.request.contextPath}/images/dog.jpg" alt="Dog Image" class="pet-image">
                </a>
            </div>

            <!-- Birds -->
            <div class="category-item">
                <h4>Birds:</h4>
                <a href="category.jsp?category=birds">
                    <img src="${pageContext.request.contextPath}/images/bird.jpg" alt="Bird Image" class="pet-image">
                </a>
            </div>

            <!-- Rabbits -->
            <div class="category-item">
                <h4>Rabbits:</h4>
                <a href="category.jsp?category=rabbits">
                    <img src="${pageContext.request.contextPath}/images/rabbit.jpg" alt="Rabbit Image" class="pet-image">
                </a>
            </div>
        </div>

        <!-- CRUD Section -->
        <div class="crud-section">
            <h2>CRUD Operations</h2>
            <button onclick="location.href='createbreed.jsp'">Create New Breed</button>
            <button onclick="location.href='deletebreed.jsp'">Delete Breed</button>
            <button onclick="location.href='fetchBreedDetails.jsp'">Fetch Breed Details</button>
            <button onclick="location.href='updateBreedDetails.jsp'">Update Breed Details</button>
        </div>
    </div>


</body>
</html>
