loadXcosLibs(); loadScicos();
K1=4
K2=1
T2=2.46
K3=2
T3=0.8
d=0.8

K1_kol_kr = 7.78
K1_ap_kr = -0.5
changed_k1=[0.8, 1, 1.2] 

// апериод когда по экспоненте в бесконечность

function[] = makeGraph(nameZCos, nameDirect)
    importXcosDiagram(nameZCos)
    Context.K1=K1
    Context.K2=K2
    Context.T2=T2
    Context.K3=K3
    Context.T3=T3
    Context.d=d
    scicos_simulate(scs_m,Context);
    filename = nameDirect + "/koleb"
    //xsave(filename + ".png")
    //xs2png(20011, filename + ".png")
endfunction

function[] = makeGraphK1(nameZCos, nameDirect, start_k)
    importXcosDiagram(nameZCos)
    for i = 1:(size(changed_k1)(2))
        Context.K1=start_k * changed_k1(i)
        Context.K2=K2
        Context.T2=T2
        Context.K3=K3
        Context.T3=T3
        Context.d=d
        scicos_simulate(scs_m,Context);
        filename = nameDirect + "/K_" + string(Context.K1)
        //xsave(filename + ".png")
        xs2png(20011, filename + ".png")
    end
endfunction

function[] = makeGraphD(nameZCos, nameDirect, start_d)
    importXcosDiagram(nameZCos)
    Context.K1=K1
    Context.K2=K2
    Context.T2=T2
    Context.K3=K3
    Context.T3=T3
    Context.d=start_d
    scicos_simulate(scs_m,Context);
    filename = nameDirect + "/d_" + string(Context.d)
    //xsave(filename + ".png")
    xs2png(20011, filename + ".png")
endfunction

function[] = makeGraphT2(nameZCos, nameDirect, start_t2)
    importXcosDiagram(nameZCos)
    Context.K1=K1
    Context.K2=K2
    Context.T2=start_t2
    Context.K3=K3
    Context.T3=T3
    Context.d=d
    scicos_simulate(scs_m,Context);
    filename = nameDirect + "/t2_" + string(Context.t2)
    //xsave(filename + ".png")
endfunction

schema_path = "C:\Users\User\Downloads\lab2\lab2\schema.zcos"
graphs_path = "C:\Users\User\Downloads\lab2\lab2\graphs"

makeGraph(schema_path, graphs_path)
//makeGraphK1(schema_path, graphs_path, K1_kol_kr)
//makeGraphK1(schema_path, graphs_path, K1_ap_kr)
//makeGraphD(schema_path, graphs_path, 0.864)
//makeGraphT2(schema_path, graphs_path, 3.732)


