using System.Text.Json.Serialization;
using T_Badge.Contracts.Authentication.Responses;
using T_Badge.Models;

namespace T_Badge.Common;

[JsonSerializable(typeof(Event[]))]
[JsonSerializable(typeof(Achievement[]))]
[JsonSerializable(typeof(User))]
[JsonSerializable(typeof(User[]))]
[JsonSerializable(typeof(AuthenticationResponse))]
internal partial class AppJsonSerializerContext : JsonSerializerContext;