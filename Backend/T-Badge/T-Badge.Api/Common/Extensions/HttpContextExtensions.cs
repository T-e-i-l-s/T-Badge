using T_Badge.Contracts.Authentication.Responses;
using T_Badge.Middlewares.Authentication;

namespace T_Badge.Common.Extensions;

public static class HttpContextExtensions
{
    public static bool TryGet<TItem>(
        this HttpContext context,
        string key,
        out TItem? result)
    {
        if (context.Items.TryGetValue(key, out var item) &&
            item is TItem typedItem)
        {
            result = typedItem;
            return true;
        }

        result = default;
        return false;
    }

    public static AuthorizationMetadata? GetIdentity(
        this HttpContext context)
    {
        return context.TryGet<AuthorizationMetadata>(AuthorizationMetadata.Key,
            out var result)
            ? result
            : null;
    }
}