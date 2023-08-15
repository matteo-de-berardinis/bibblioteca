<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Errore - Libro non trovato</title>
    <style>
        body {
            text-align: center;
        }

        .error-container {
            margin-top: 100px;
        }

        .error-icon {
            font-size: 100px;
            color: red;
        }

        .error-message {
            margin-top: 20px;
            font-size: 24px;
        }

        .back-link {
            margin-top: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">&#x274C;</div>
        <div class="error-message">Libro non trovato. Torna alla lista dei libri.</div>
        <a href="libri.jsp" class="back-link">Torna alla lista dei libri</a>
    </div>
</body>
</html>