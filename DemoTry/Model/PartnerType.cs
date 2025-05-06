using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class PartnerType
{
    public byte TypeId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Partner> Partners { get; set; } = new List<Partner>();
}
