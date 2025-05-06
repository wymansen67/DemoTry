using System;
using System.Collections.Generic;

namespace DemoTry.Model;

public partial class MaterialType
{
    public byte TypeId { get; set; }

    public string Name { get; set; } = null!;

    public string BrakPercent { get; set; } = null!;
}
