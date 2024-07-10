using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace T_Badge.Models;

public class Achievement
{
    [Key, JsonIgnore]
    public int Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public User Owner { get; set; }
}