<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Complimenti per il tuo acquisto</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      text-align: center;
      padding: 20px;
    }
    
    h1 {
      color: #333;
    }
    
    .check-icon {
      font-size: 150px;
      color: #008000;
      margin-bottom: 20px;
    }
    
    .home-button {
      padding: 10px 20px;
      background-color: #008000;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <h1>Libro inserito con sucesso </h1>
  
  <i class="fas fa-check-circle check-icon"></i>
  

  
  <button class="home-button" onclick="window.location.href = 'homeAdmin.jsp';">Torna alla Home</button>
</body>
</html>