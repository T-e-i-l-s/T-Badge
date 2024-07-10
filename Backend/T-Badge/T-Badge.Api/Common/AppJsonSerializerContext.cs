using System.Text.Json.Serialization;
using T_Badge.Contracts.Authentication.Responses;
using T_Badge.Contracts.Events.Requests;
using T_Badge.Middlewares.Authentication;
using T_Badge.Models;

namespace T_Badge.Common;

[JsonSerializable(typeof(Event[]))]
[JsonSerializable(typeof(Event))]
[JsonSerializable(typeof(Achievement[]))]
[JsonSerializable(typeof(User))]
[JsonSerializable(typeof(User[]))]
[JsonSerializable(typeof(AuthenticationResponse))]
[JsonSerializable(typeof(AuthorizationMetadata))]
[JsonSerializable(typeof(CreateEventRequest))]
internal partial class AppJsonSerializerContext : JsonSerializerContext;