<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Errore - Utente non esiste</title>
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
    
    .error-icon {
      font-size: 100px;
      color: #ff0000;
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
  <h1>Errore - Utente non esiste</h1>
  
  <i class="fas fa-times-circle error-icon"></i>
  
  <p>L'utente cercato non esiste nel nostro sistema.</p>
  
  <button class="home-button" onclick="window.location.href = 'index.jsp';">Torna alla Home</button>
</body>
</html>
