<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生情報変更</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* カスタムスタイル */
        .page-header {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 2rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
        }

        .readonly-field {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 0.375rem 0.75rem;
            border-radius: 0.375rem;
            color: #6c757d;
        }

        .checkbox-custom {
            transform: scale(1.2);
        }

        .btn-group-custom {
            gap: 1rem;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 2px 10px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">学生情報変更</h2>
                        <form action="StudentUpdateExecute.action" method="post">
                            <%-- 変更対象の学生番号をhiddenで送信 --%>
                            <input type="hidden" name="no" value="${student.no}">

                            <div class="mb-3">
                                <label class="form-label">入学年度</label>
                                <div class="readonly-field">
                                    <c:out value="${student.entYear}" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">学生番号</label>
                                <div class="readonly-field">
                                    <c:out value="${student.no}" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="name" class="form-label">氏名</label>
                                <input type="text"
                                       class="form-control"
                                       id="name"
                                       name="name"
                                       value="<c:out value="${student.name}" />"
                                       required>
                            </div>

                            <div class="mb-3">
                                <label for="classNum" class="form-label">クラス</label>
                                <select class="form-select" id="classNum" name="classNum">
                                    <c:forEach var="num" items="${class_num_set}">
                                        <option value="${num}" <c:if test="${num == student.classNum}">selected</c:if>>${num}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-4">
                                <div class="form-check">
                                    <label class="form-check-label me-3" for="isAttend">
                                        在学中
                                    </label>
                                    <input class="form-check-input checkbox-custom"
                                           type="checkbox"
                                           name="isAttend"
                                           value="true"
                                           id="isAttend"
                                           <c:if test="${student.attend}">checked</c:if>>
                                </div>
                            </div>

                            <div class="d-flex flex-column">
                                <button type="button" class="btn-custom mb-3">
                                    変更
                                </button>
                                <a href="StudentList.action" class="text-decoration-none">
                                    戻る
                                </a>
                            </div>
                        </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>