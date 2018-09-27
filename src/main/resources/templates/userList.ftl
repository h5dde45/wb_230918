<#import "parts/common.ftl" as c>

<@c.page>

<div class="col-sm-6">
    <table class="table mt-3">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Username</th>
            <th scope="col">Roles</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
            <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td>
                    <#list user.roles as role>${role}<#sep >, </#list>
                </td>
                <td><a href="/user/${user.id}">Edit</a></td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>

</@c.page>