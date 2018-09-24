<#import "parts/common.ftl" as c>

<@c.page>

<div class="col-sm-4 mt-3 ml-5">
    <form action="/user" method="post">
        <div class="form-group">
            <label for="exampleInputUsername">Username</label>
            <input type="text" class="form-control" name="username"
                   id="exampleInputUsername" value="${user.username}">
        </div>
        <#list roles as role>
            <div class="form-group form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input"
                    ${user.roles?seq_contains(role)?string("checked", "")} name="${role}">
                ${role}</label>
            </div>
        </#list>


        <input type="hidden" name="userId" value="${user.id}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
</@c.page>