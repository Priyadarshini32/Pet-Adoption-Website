<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Breed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0px; /* Add padding */
        }

        .create-breed-form {
            width: 80%; /* Set width to 80% of the viewport */
            max-width: 900px; /* Set maximum width */
            margin: 20px auto; /* Center horizontally */
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .create-breed-form h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .create-breed-form label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }

        .create-breed-form input[type="text"],
        .create-breed-form select,
        .create-breed-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .create-breed-form textarea {
            resize: vertical;
            min-height: 100px;
        }

        .create-breed-form button {
            width: 100%;
            padding: 10px;
            background-color: #009688;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .create-breed-form button:hover {
            background-color: #00796b;
        }
    </style>
</head>
<body>
    <div class="create-breed-form">
        <h2>Create a New Breed</h2>
        <form action="CreateBreedServlet" method="post" enctype="multipart/form-data">
            <label for="breedName">Breed Name:</label>
            <input type="text" id="breedName" name="breedName" placeholder="Enter breed name" required>

            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value="" disabled selected>Select category</option>
                <option value="cats">Cats</option>
                <option value="dogs">Dogs</option>
                <option value="birds">Birds</option>
                <option value="rabbits">Rabbits</option>
            </select>

            <label for="age">Age:</label>
            <input type="text" id="age" name="age" placeholder="Enter age" required>

            <label for="lifespan">Lifespan:</label>
            <input type="text" id="lifespan" name="lifespan" placeholder="Enter lifespan" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="Enter description" rows="2" required></textarea>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required><br>
            <br>

            <button type="submit">Create Breed</button>
        </form>
    </div>
</body>
</html>
