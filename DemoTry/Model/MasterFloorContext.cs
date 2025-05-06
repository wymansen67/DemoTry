using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DemoTry.Model;

public partial class MasterFloorContext : DbContext
{
    public MasterFloorContext()
    {
    }

    public MasterFloorContext(DbContextOptions<MasterFloorContext> options)
        : base(options)
    {
    }

    public virtual DbSet<MaterialType> MaterialTypes { get; set; }

    public virtual DbSet<Partner> Partners { get; set; }

    public virtual DbSet<PartnerProduct> PartnerProducts { get; set; }

    public virtual DbSet<PartnerType> PartnerTypes { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductType> ProductTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=PC310-08;Database=MasterFloor;TrustServerCertificate=True;Trusted_Connection=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MaterialType>(entity =>
        {
            entity.HasKey(e => e.TypeId);

            entity.ToTable("Material_type");

            entity.Property(e => e.TypeId).HasColumnName("TypeID");
            entity.Property(e => e.BrakPercent).HasMaxLength(5);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Partner>(entity =>
        {
            entity.HasKey(e => e.Tin);

            entity.Property(e => e.Tin).ValueGeneratedNever();
            entity.Property(e => e.Area).HasMaxLength(50);
            entity.Property(e => e.Building).HasMaxLength(50);
            entity.Property(e => e.City).HasMaxLength(50);
            entity.Property(e => e.DirectorFirstname)
                .HasMaxLength(50)
                .HasColumnName("Director_firstname");
            entity.Property(e => e.DirectorLastname)
                .HasMaxLength(50)
                .HasColumnName("Director_lastname");
            entity.Property(e => e.DirectorMiddlename)
                .HasMaxLength(50)
                .HasColumnName("Director_middlename");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);
            entity.Property(e => e.Rating).HasColumnType("decimal(18, 10)");
            entity.Property(e => e.Street).HasMaxLength(50);

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Partners)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Partners_Partner_type");
        });

        modelBuilder.Entity<PartnerProduct>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Partner_product");

            entity.HasOne(d => d.PartnerNavigation).WithMany()
                .HasForeignKey(d => d.Partner)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Partner_product_Partners");

            entity.HasOne(d => d.ProductNavigation).WithMany()
                .HasForeignKey(d => d.Product)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Partner_product_Products");
        });

        modelBuilder.Entity<PartnerType>(entity =>
        {
            entity.HasKey(e => e.TypeId);

            entity.ToTable("Partner_type");

            entity.Property(e => e.TypeId).HasColumnName("TypeID");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.Articul);

            entity.Property(e => e.Articul).ValueGeneratedNever();
            entity.Property(e => e.MinimalPriceForPartner)
                .HasColumnType("decimal(18, 10)")
                .HasColumnName("Minimal_price_for_partner");
            entity.Property(e => e.Name).HasMaxLength(100);

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Product_type");
        });

        modelBuilder.Entity<ProductType>(entity =>
        {
            entity.HasKey(e => e.TypeId);

            entity.ToTable("Product_type");

            entity.Property(e => e.TypeId)
                .ValueGeneratedNever()
                .HasColumnName("TypeID");
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.TypeCoefficient).HasColumnType("decimal(18, 10)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
