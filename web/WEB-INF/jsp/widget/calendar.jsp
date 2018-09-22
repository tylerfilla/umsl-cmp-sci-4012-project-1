<%--@elvariable id="meetings" type="java.util.Map<Integer, java.util.Map<Integer, edu.umsl.tsfn88.cs4012.project1.servlet.CalendarWidgetServlet$DisplayedMeeting>>"--%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        .calendar-left-col {
            width: 200px;
        }
        .calendar-head-col {
            width: 100px;
        }
        .calendar-data-row {
            height: 40px;
        }
        .calendar-data-col {
            padding: 0 !important;
            height: 100%;
        }
        .meeting-box-out {
            position: relative;
            height: 100%;
        }
        .meeting-box {
            position: absolute;
            width: calc(100% - 8px);
            margin-left: 4px;
            margin-right: 4px;
            z-index: 2;
            border: 1px solid #d0d0d0;
            background: #e0e0e0;
        }
    </style>
</head>
<body>
<table class="table table-striped table-hover" style="margin: 0;">
    <thead>
    <tr>
        <th class="calendar-left-col"></th>
        <th class="calendar-head-col">Sunday</th>
        <th class="calendar-head-col">Monday</th>
        <th class="calendar-head-col">Tuesday</th>
        <th class="calendar-head-col">Wednesday</th>
        <th class="calendar-head-col">Thursday</th>
        <th class="calendar-head-col">Friday</th>
        <th class="calendar-head-col">Saturday</th>
    </tr>
    </thead>
</table>
<table class="table table-striped table-hover">
    <tbody>
    <c:forEach var="hour24" begin="${0}" end="${23}">
        <c:choose>
            <c:when test="${hour24 == 0}">
                <c:set var="loHour" value="12:00a"/>
                <c:set var="hiHour" value="1:00a"/>
            </c:when>
            <c:when test="${hour24 < 11}">
                <c:set var="loHour" value="${hour24}:00a"/>
                <c:set var="hiHour" value="${hour24 + 1}:00a"/>
            </c:when>
            <c:when test="${hour24 == 11}">
                <c:set var="loHour" value="11:00a"/>
                <c:set var="hiHour" value="12:00p"/>
            </c:when>
            <c:when test="${hour24 == 12}">
                <c:set var="loHour" value="12:00p"/>
                <c:set var="hiHour" value="1:00p"/>
            </c:when>
            <c:when test="${hour24 < 23}">
                <c:set var="loHour" value="${hour24 % 12}:00p"/>
                <c:set var="hiHour" value="${hour24 % 12 + 1}:00p"/>
            </c:when>
            <c:when test="${hour24 == 23}">
                <c:set var="loHour" value="11:00p"/>
                <c:set var="hiHour" value="12:00a"/>
            </c:when>
        </c:choose>
        <tr class="calendar-data-row">
            <th class="calendar-left-col">${loHour} - ${hiHour}</th>
            <c:forEach var="day" begin="0" end="6">
                <td class="calendar-data-col">
                    <c:set var="meeting" value="${meetings[day][hour24]}"/>
                    <c:if test="${not empty meeting}">
                        <div class="meeting-box-out" style="top: ${meeting.hourOffset * 100}%;">
                            <div class="meeting-box" style="height: calc(${meeting.hourSpan * 100}% + ${meeting.hourSpan}px);">
                                    ${meeting.name}
                            </div>
                        </div>
                    </c:if>
                    <c:remove var="meeting"/>
                </td>
            </c:forEach>
        </tr>
        <c:remove var="loHour"/>
        <c:remove var="hiHour"/>
    </c:forEach>
    </tbody>
</table>
</body>
</html>