.class Lcom/android/settings/MasterReset$2;
.super Ljava/lang/Object;
.source "MasterReset.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/MasterReset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/MasterReset;


# direct methods
.method constructor <init>(Lcom/android/settings/MasterReset;)V
    .locals 0
    .parameter

    .prologue
    .line 147
    iput-object p1, p0, Lcom/android/settings/MasterReset$2;->this$0:Lcom/android/settings/MasterReset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 149
    iget-object v0, p0, Lcom/android/settings/MasterReset$2;->this$0:Lcom/android/settings/MasterReset;

    const/16 v1, 0x37

    #calls: Lcom/android/settings/MasterReset;->runKeyguardConfirmation(I)Z
    invoke-static {v0, v1}, Lcom/android/settings/MasterReset;->access$000(Lcom/android/settings/MasterReset;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/android/settings/MasterReset$2;->this$0:Lcom/android/settings/MasterReset;

    #calls: Lcom/android/settings/MasterReset;->establishFinalConfirmationState()V
    invoke-static {v0}, Lcom/android/settings/MasterReset;->access$100(Lcom/android/settings/MasterReset;)V

    .line 152
    :cond_0
    return-void
.end method