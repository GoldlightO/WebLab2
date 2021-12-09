<%@ page import="src.AreaCheckServlet" %>
<%@ page import="src.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная 2 Веб-программировнаие</title>
    <style type="text/css">

        .Xbuttons:focus {
            background-color: lightblue;
        }

        .sendbutton:focus {
            background-color: greenyellow;
        }

        .resetbutton:focus {
            background-color: red;
        }

        .inputtable {
            width: 100%;
        }

        .result-table {
            width: 100%;
            background-color: #efefef;
            vertical-align: top;
            horizontall-align: center;
        }

        .main-table {
            border: 1px solid;
            background-color: #efefef;
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

        .headresult {
            background-color: #b0e0e6;
        }


        .result {
            vertical-align: top;
            horizontall-align: center;
        }

        TD, TH {
            padding: 3px;
            border: 1px solid black;
        }

        #click_catcher {
            width:300px;
            max-width:300px;
            height: 300px;
            max-height: 300px;
            display: inline-block;
        }
    </style>
</head>
<body>
<table class="main-table">
    <tr>
        <th>
            <h1>
                Савельев Олег Максимович<br>
                Группа: P3233<br>
                Вариант: 33659
            </h1>
        </th>
        <th class="secondcell">
            <p>Введите координаты точки и радиус:</p>
            <table class="inputtable">
                <tr>
                    <th>X:</th>
                    <th>
                        <% for (int xVal = -5; xVal <= 3; xVal++) { %>
                        <button class="Xbuttons" type="button" id="btn-<%=xVal%>" onclick="setX(<%=xVal%>)"><%=xVal%>
                        </button>
                        <% } %>
                    </th>
                </tr>
                <tr>
                    <th>Y:</th>
                    <th>
                        <label><input placeholder="Введите Y:(-3 ... 5)" maxlength="15" step="0.000000001" required
                                      id="y" type="text"></label>
                    </th>
                </tr>
                <tr>
                    <th>R:</th>
                    <th>
                        <input name="R" type="radio" id="contactChoice1" value="1">
                        <label for="contactChoice1" class="R-label">1</label>

                        <input name="R" type="radio" id="contactChoice1.5" value="1.5">
                        <label for="contactChoice1.5" class="R-label">1.5</label>

                        <input name="R" type="radio" id="contactChoice2" value="2">
                        <label for="contactChoice2" class="R-label">2</label>

                        <input name="R" type="radio" id="contactChoice2.5" value="2.5">
                        <label for="contactChoice2.5" class="R-label">2.5</label>

                        <input name="R" type="radio" id="contactChoice3" value="3">
                        <label for="contactChoice3" class="R-label">3</label>
                    </th>
                </tr>
                <tr>
                    <th>
                        <button class="sendbutton" type="button" onclick="submitdata()">Отправить</button>
                    </th>
                    <th>
                        <button class="resetbutton" type="button" onclick="reset()">Очистить</button>
                    </th>
                </tr>
            </table>
        </th>
    </tr>
    <tr>
        <td class="control-panel">
            <div id="click_catcher">
                <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg" id="graph" style="pointer-events: none">
                    <!-- Оси со стрелками   -->
                    <line stroke="black"
                          x1="0"
                          x2="300"
                          y1="150"
                          y2="150"
                    ></line>
                    <line stroke="black"
                          x1="150"
                          x2="150"
                          y1="0"
                          y2="300"
                    ></line>
                    <polygon fill="black"
                             class="svg-arrow"
                             points="150,0 144,15 156,15"
                             stroke="white"
                    ></polygon>
                    <polygon fill="black"
                             class="svg-arrow"
                             points="300,150 285,156 285,144"
                             stroke="white"
                    ></polygon>

                    <!-- Засечки    -->
                    <line stroke="black"
                          x1="200"
                          x2="200"
                          y1="155"
                          y2="145"
                    ></line>
                    <line stroke="black"
                          x1="250"
                          x2="250"
                          y1="155"
                          y2="145"></line>

                    <line stroke="black"
                          x1="50"
                          x2="50"
                          y1="155"
                          y2="145"></line>
                    <line stroke="black"
                          x1="100"
                          x2="100"
                          y1="155"
                          y2="145"></line>

                    <line stroke="black"
                          x1="145"
                          x2="155"
                          y1="100"
                          y2="100"></line>
                    <line stroke="black"
                          x1="145"
                          x2="155"
                          y1="50"
                          y2="50"></line>

                    <line stroke="black"
                          x1="145"
                          x2="155"
                          y1="200"
                          y2="200"></line>
                    <line stroke="black"
                          x1="145"
                          x2="155"
                          y1="250"
                          y2="250"></line>

                    <!-- Подписи к засечкам    -->
                    <text fill="black"
                          x="195"
                          y="140"
                    >R/2
                    </text>
                    <text fill="black"
                          x="248"
                          y="140"
                    >R
                    </text>

                    <text fill="black"
                          x="40"
                          y="140"
                    >-R
                    </text>
                    <text fill="black"
                          x="90"
                          y="140"
                    >-R/2
                    </text>

                    <text fill="black"
                          x="160"
                          y="105"
                    >R/2
                    </text>
                    <text fill="black"
                          x="160"
                          y="55"
                    >R
                    </text>

                    <text fill="black"
                          x="160"
                          y="205"
                    >-R/2
                    </text>
                    <text fill="black"
                          x="160"
                          y="255"
                    >-R
                    </text>

                    <text fill="black"
                          x="160"
                          y="10"
                    >Y
                    </text>
                    <text fill="black"
                          x="290"
                          y="140"
                    >X
                    </text>

                    <!-- first figure triangle -->
                    <polygon fill="blue"
                             fill-opacity="0.3"
                             points="150,200 150,150 50,150"
                             stroke="blue"
                             id="figure1"></polygon>

                    <!-- second figure rectangle-->
                    <polygon fill="red"
                             fill-opacity="0.3"
                             points="200,150 200,250 150,250 150,150"
                             stroke="red"
                             id="figure2"></polygon>

                    <!-- third figure circle-->
                    <path d="M 200 150 L 150 150 L 150 100 C 175 100 200 125 200 150 Z"
                          fill="green"
                          fill-opacity="0.3"
                          stroke="green"
                          id="figure3"></path>
                    <% if (session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS) != null) {
                        for (Point p : (ArrayList<Point>) session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS)) { %>
                    <circle cx="<%=p.getX() * 20 + 150%>" cy="<%=-p.getY() * 20 + 150%>" r="4" class="littleDot"
                            fill="<%=p.isInsideArea() ? "mediumspringgreen" : "palevioletred"%>"></circle>
                    <%
                            }
                        }
                    %>
                </svg>
            </div>
        </td>
        <td class="result">
            <p>Результат:</p>
            <table class="result-table" id="tbody">
                <tr class="headresult">
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                    <th>Время</th>
                </tr>
                <tbody id="table-place">
                <% if (session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS) != null) {
                    for (Point p : (ArrayList<Point>) session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS)) { %>
                <tr>
                    <td><%=p.getX()%>
                    </td>
                    <td><%=p.getY()%>
                    </td>
                    <td><%=p.getR()%>
                    </td>
                    <td><%=p.isInsideArea() ? "да" : "нет"%>
                    </td>
                    <td><%=p.getExecutionTime()%>нс</td>
                </tr>
                <% }
                } %>
                </tbody>
            </table>
        </td>
</table>
<script type="text/javascript" src="jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="check.js"></script>
</body>
</html>