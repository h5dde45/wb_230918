<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

<div class="alert alert-info mt-3" role="alert">
    Page is by user:   <i>${userChannel.username}</i>
</div>

    <#if !isCurrentUser>
        <#if isSubscriber>
        <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
        <#else>
        <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
        </#if>
    </#if>
<div class="container my-3">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Subscriptions</div>
                    <h3 class="card-text">
                        <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Subscribers</div>
                    <h3 class="card-text">
                        <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</div>

    <#if message??>
    <a class="btn btn-primary " data-toggle="collapse" href="#collapseExample"
       role="button" aria-expanded="false" aria-controls="collapseExample">
        Message editor
    </a>

    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form action="/user-messages/${currentUserId}" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>"
                           name="text" placeholder="Enter message.."/>
                    <#if textError??>
                        <div class="invalid-feedback">
                        ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>"
                           name="tag" placeholder="Enter tag..">
                    <#if tagError??>
                        <div class="invalid-feedback">
                        ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Select the file in png format..</label>
                    </div>
                </div>
                <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Save message</button>
                </div>
            </form>
        </div>
    </div>
    </#if>

<div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.image??>
                <img src="/img/${message.id}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>

</@c.page>