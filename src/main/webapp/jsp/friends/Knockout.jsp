<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
    
<head>
<meta name="viewport" content="width=device-width" />
<title>
    Index2
</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/knockout-3.4.2.js"></script>
<script type="text/javascript">
    //定义user数据对象
    function UserViewModel(id, name, score) {
        var self = this;
        self.id = id;
        self.name = name;
        self.score = score;
    }
    //定义ViewModel
    function ViewModel() {
        var self = this;
        self.users = ko.observableArray(); //添加动态监视数组对象
        self.removeUser = function(user) {
            self.users.remove(user);
        }
        self.totalscore = ko.computed(function() {
            var total = 0;
            $.each(self.users(),
            function(i, u) {
                total += u.score;
            })
            return total;
        });
    };
    $(function() {
        var vm = new ViewModel();
        //预先添加一些数据
        vm.users.push(new UserViewModel("d1", "rohelm", 121));
        vm.users.push(new UserViewModel("d2", "halower", 125));
        $("#btnAddUser").click(function() {
            vm.users.push(new UserViewModel(
            $("#u_id").val(), $("#u_name").val(), parseInt($("#u_score").val())));
        });
        ko.applyBindings(vm);
    });
</script>
</head>

<body>
    <section style="margin:250px">
        <section>
            ID
            <input type="text" id="u_id" style="width:30px">
            Name
            <input type="text" id="u_name" style="width:30px">
            Score
            <input type="text" id="u_score" style="width:30px">
            <br/>
            <input value="Add" id="btnAddUser" type="button" style="width:200px; background-color:#ff6a00;"
            />
            <br/>
            共
            <span data-bind="text: users().length">
            </span>
            条--------------合计
            <span data-bind="text: totalscore">
            </span>
            分
        </section>
        <section>
            <table>
                <thead>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Name
                        </th>
                        <th>
                            Score
                        </th>
                        <th>
                            Option
                        </th>
                    </tr>
                </thead>
                <tbody data-bind="foreach: users">
                    <tr>
                        <td>
                            <span data-bind="text: id">
                            </span>
                        </td>
                        <td>
                            <span data-bind="text: name">
                            </span>
                        </td>
                        <td>
                            <span data-bind="text: score">
                            </span>
                        </td>
                        <td>
                            <a href='#' data-bind="click: $root.removeUser">
                                Remove
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </section>
</body>

</html>