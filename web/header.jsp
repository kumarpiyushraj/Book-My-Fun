<%@ page %>
<!--<div style=" display: flex; justify-content: space-between; background-color: lightsteelblue; height: 25px; padding: 10px;">
    <button style="background-color: steelblue; font-weight: bold; font-size: 14px; padding: 5px 15px; text-align: center;" onclick="history.back()">Back</button>

    <form action="ControllerServlet" method="post">
        <input type="hidden" name="Value" value="LogoutUser">
        <button style="background-color: #990000; font-weight: bold; font-size: 14px; padding: 5px 15px; text-align: center;s" type="submit">Logout</button>
        </form>
</div>-->
<div style="position: fixed; top: 0; left: 0; width: 100%; display: flex; justify-content: space-between; background-color: lightsteelblue; height: 25px; padding: 10px; z-index: 999;">
    <button style="background-color: steelblue; font-weight: bold; font-size: 14px; padding: 5px 15px; text-align: center;" onclick="history.back()">Back</button>

    <form action="ControllerServlet" method="post">
        <input type="hidden" name="Value" value="LogoutUser">
        <button style="background-color: #990000; font-weight: bold; font-size: 14px; padding: 5px 15px; text-align: center; margin-right: 20px;" type="submit">Logout</button>
    </form>
</div>
