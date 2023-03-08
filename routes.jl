using Genie.Router, Genie.Sessions, Genie.Renderer
using Genie.Renderer.Html, Genie.Requests

using TermoQuimica

#Genie.config.session_storage = :File
#Sessions.init()
#path"app/resources/libros/views/billgateslibros.jl.html"

struct cosa
	valor::Int8
	error::Bool
end

struct R
    metodo
	n::Int
    l::Int
    x
    y
    v
    grafica
	un
	t_o_p
	error::Bool
end

struct ecuaciones_estado
	H
	U
	S
	G
	A
	φ
	f
	z
	v
	n
end

struct eos_e
	T
	uT
	P
	uP
	Tc
	uTc
	Pc
	uPc
	y
	𝜔
end

function sustituye1()
    midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/ideal.jl.html", error=midic1)
end

function sustituye2()
    midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/margules.jl.html", error=midic1)
end

function sustituye3()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/vanlaar.jl.html", error=midic1)
end

function sustituye4()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/wilson.jl.html", error=midic1)
end

function sustituye5()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/wilsonmod.jl.html", error=midic1)
end

function sustituye6()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/nrtl.jl.html", error=midic1)
end

function sustituye7()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/unifac.jl.html", error=midic1)
end

function sustituye8()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/uniquac.jl.html", error=midic1)
end

function sustituye9()
	midic1 = [cosa(1,false),cosa(1,false)]
    html(path"public/unifacmod.jl.html", error=midic1)
end

function sustituye10()
	midic1 = [cosa(0,false),cosa(0,false)]
    html(path"public/eos.jl.html", error=midic1)
end

function sustituye11()
	midic1 = [cosa(0,false),cosa(0,false)]
    html(path"public/saft.jl.html", error=midic1)
end

function f1()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/ideal.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f2()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/margules.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f3()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/vanlaar.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f4()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/wilson.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f5()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/wilsonmod.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f6()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/nrtl.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f7()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/unifac.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f8()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/uniquac.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f9()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/unifacmod.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f10()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/eos.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function f11()
    nn = parse(Int8,@params(:n))
	midic1 = [cosa(nn,true),cosa(1,false)]
    html(path"public/saft.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function ff1()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = ideal.pxy(n,T,CA,x,uni=usalida2)

    else
		tabla = "Temperatura"
		P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = ideal.txy(n,P,CA,x,uni=usalida2)
	end
	
	l = length(pp)
	
	if n==2
        p1 = plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
		p1 = plot!(yy[1,:],ustrip(pp),xlabel="x₁ , y₁",ylabel=usalida,label="Vapor",legend=(1.02, 1.0))
		plt = repr("text/html",p1)
		midic1 = R("Ideal",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		plt = repr("text/html",fig1)*repr("text/html",fig2)
		midic1 = R("Ideal",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("Ideal",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)

end

function ff2()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"A$k") && endswith(grup,"$i")
					A[k,i] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = margules.pxy(n,T,CA,A,x,uni=usalida2)

    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = margules.txy(n,P,CA,A,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
		p1 = plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
		p1 = plot!(yy[1,:],ustrip(pp),xlabel="x₁ , y₁",ylabel=usalida,label="Vapor",legend=(1.02, 1.0))
		plt = repr("text/html",p1)
		midic1 = R("Margules",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	else
		midic1 = R("Margules",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end


    html(path"public/resulvanlaar.jl.html", e = midic1)

end

function ff3()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"A$k") && endswith(grup,"$i")
					A[k,i] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else 
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = vanlaar.pxy(n,T,CA,A,x,uni=usalida2)
    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = vanlaar.txy(n,P,CA,A,x,uni=usalida2)
    end

	l = length(pp)

	if n==2 
		p1 = plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
		p1 = plot!(yy[1,:],ustrip(pp),xlabel="x₁ , y₁",ylabel=usalida,label="Vapor",legend=(1.02, 1.0))
		plt = repr("text/html",p1)
		midic1 = R("Van Laar",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	else
		midic1 = R("Van Laar",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)

end

function ff4()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	v = Vector{Float64}(undef,n)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
            if startswith(grup,"v$k")
                v[k] = parse(Float64,value)
            end
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"Δg$i") && endswith(grup,"$k")
					A[i,k] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = wilson.pxy(n,T,CA,A*u"cal/mol",v,x,uni=usalida2)

    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = wilson.txy(n,P,CA,A*u"cal/mol",v,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
        #fig = go.Figure()
        #fig.add_trace(go.Scatter(x=np.array(xx[1,:]), y=np.array(ustrip(pp)),
          #          mode="lines",
         #           name="Liquido"))
        #fig.add_trace(go.Scatter(x=np.array(yy[1,:]), y=np.array(ustrip(pp)),
           #         mode="lines",
            #        name="Vapor"))
        #plt = repr("text/html",fig)


		#=p1 = scatter(;x=xx[1,:],y=ustrip(pp),name="Liquido")
		p2 = scatter(;x=yy[1,:],y=ustrip(pp),xaxis=attr(title="x₁ , y₁"),yaxis=attr(title=usalida),name="Vapor")
		p3 = plot([p1,p2])
        plt = repr("text/html",p3)=#
        p1=plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(yy[1,:],ustrip(pp),xaxis="x₁ , y₁",yaxis=usalida,label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("Wilson",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)
        #x1,x2=△(xx[1,:],xx[2,:])
		#y1,y2=△(yy[1,:],yy[2,:])
		#scatter(0.5,√3/2,label="x₃")
		#scatter(1,0,label="x₂")
		#scatter(0,0,label="x₁")
		#graficar3(x1,x2,y1,y2,pp,usalida)
		midic1 = R("Wilson",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("Wilson",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

function ff5()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
    a = zeros(n,n)
    b = zeros(n,n)
    c = zeros(n,n)
	v = Vector{Float64}(undef,n)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
            if startswith(grup,"v$k")
                v[k] = parse(Float64,value)
            end
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"Δg$i") && endswith(grup,"$k")
					A[i,k] = parse(Float64,value)
				end
                if startswith(grup,"a$i") && endswith(grup,"$k")
					a[i,k] = parse(Float64,value)
				end
                if startswith(grup,"b$i") && endswith(grup,"$k")
					b[i,k] = parse(Float64,value)
				end
                if startswith(grup,"c$i") && endswith(grup,"$k")
					c[i,k] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = wilsonmod.pxy(n,T,CA,a,b,c,v,x,uni=usalida2)

    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = wilsonmod.txy(n,P,CA,a,b,c,v,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
        #fig = go.Figure()
        #fig.add_trace(go.Scatter(x=np.array(xx[1,:]), y=np.array(ustrip(pp)),
          #          mode="lines",
         #           name="Liquido"))
        #fig.add_trace(go.Scatter(x=np.array(yy[1,:]), y=np.array(ustrip(pp)),
           #         mode="lines",
            #        name="Vapor"))
        #plt = repr("text/html",fig)


		#=p1 = scatter(;x=xx[1,:],y=ustrip(pp),name="Liquido")
		p2 = scatter(;x=yy[1,:],y=ustrip(pp),xaxis=attr(title="x₁ , y₁"),yaxis=attr(title=usalida),name="Vapor")
		p3 = plot([p1,p2])
        plt = repr("text/html",p3)=#
        p1=plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(yy[1,:],ustrip(pp),xaxis="x₁ , y₁",yaxis=usalida,label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("Wilson Modificado",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)
        #x1,x2=△(xx[1,:],xx[2,:])
		#y1,y2=△(yy[1,:],yy[2,:])
		#scatter(0.5,√3/2,label="x₃")
		#scatter(1,0,label="x₂")
		#scatter(0,0,label="x₁")
		#graficar3(x1,x2,y1,y2,pp,usalida)
		midic1 = R("Wilson Modificado",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("Wilson Modificado",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

function ff6()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	α = zeros(n,n)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"Δg$i") && endswith(grup,"$k")
					A[i,k] = parse(Float64,value)
				end
				if startswith(grup,"α$i") && endswith(grup,"$k")
					α[i,k] = parse(Float64,value)
					α[k,i] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = nrtl.pxy(n,T,CA,A*u"cal/mol",α,x,uni=usalida2)
    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = nrtl.txy(n,P,CA,A*u"cal/mol",α,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
        #fig = go.Figure()
        #fig.add_trace(go.Scatter(x=np.array(xx[1,:]), y=np.array(ustrip(pp)),
          #          mode="lines",
         #           name="Liquido"))
        #fig.add_trace(go.Scatter(x=np.array(yy[1,:]), y=np.array(ustrip(pp)),
           #         mode="lines",
            #        name="Vapor"))
        #plt = repr("text/html",fig)


		#=p1 = scatter(;x=xx[1,:],y=ustrip(pp),name="Liquido")
		p2 = scatter(;x=yy[1,:],y=ustrip(pp),xaxis=attr(title="x₁ , y₁"),yaxis=attr(title=usalida),name="Vapor")
		p3 = plot([p1,p2])
        plt = repr("text/html",p3)=#
        p1=plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(yy[1,:],ustrip(pp),xaxis="x₁ , y₁",yaxis=usalida,label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("NRTL",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)
        #x1,x2=△(xx[1,:],xx[2,:])
		#y1,y2=△(yy[1,:],yy[2,:])
		#scatter(0.5,√3/2,label="x₃")
		#scatter(1,0,label="x₂")
		#scatter(0,0,label="x₁")
		#graficar3(x1,x2,y1,y2,pp,usalida)
		midic1 = R("NRTL",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("NRTL",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

function ff7()
    n = parse(Int,@params(:n))
    ng = parse(Int,@params(:ng))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
    frecuencia = zeros(n,ng)
	grupos = Vector{String}(undef,ng)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:ng
				if startswith(grup,"grup$i")
					grupos[i] = value
				end
				if startswith(grup,"fre$k") && endswith(grup,"$i")
					frecuencia[k,i] = parse(Int,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = unifac.pxy(n,T,CA,grupos,frecuencia,x,uni=usalida2)
    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = unifac.txy(n,P,CA,grupos,frecuencia,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
        #fig = go.Figure()
        #fig.add_trace(go.Scatter(x=np.array(xx[1,:]), y=np.array(ustrip(pp)),
          #          mode="lines",
         #           name="Liquido"))
        #fig.add_trace(go.Scatter(x=np.array(yy[1,:]), y=np.array(ustrip(pp)),
           #         mode="lines",
            #        name="Vapor"))
        #plt = repr("text/html",fig)


		#=p1 = scatter(;x=xx[1,:],y=ustrip(pp),name="Liquido")
		p2 = scatter(;x=yy[1,:],y=ustrip(pp),xaxis=attr(title="x₁ , y₁"),yaxis=attr(title=usalida),name="Vapor")
		p3 = plot([p1,p2])
        plt = repr("text/html",p3)=#
        p1=plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(yy[1,:],ustrip(pp),xaxis="x₁ , y₁",yaxis=usalida,label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("UNIFAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)
        #x1,x2=△(xx[1,:],xx[2,:])
		#y1,y2=△(yy[1,:],yy[2,:])
		#scatter(0.5,√3/2,label="x₃")
		#scatter(1,0,label="x₂")
		#scatter(0,0,label="x₁")
		#graficar3(x1,x2,y1,y2,pp,usalida)
		midic1 = R("UNIFAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("UNIFAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

function ff8()
	n = parse(Int,@params(:n))
	todasv = Genie.Requests.getpayload()
    CA = Matrix{Float64}(undef,n,3)
	A = Matrix{Float64}(undef,n,n)
	T = parse(Float64,@params(:T))
	uni = @params(:unidadT)
    usalida = @params(:usalida)
    tipo = @params(:tipo)
	x = Vector{Any}(undef,n-1)
	r = Vector{Float64}(undef,n)
	q = Vector{Float64}(undef,n)
	rango = true 

    for (key,value) in todasv
        grup = String(key)
        for k=1:n
            if startswith(grup,"r$k")
                r[k] = parse(Float64,value)
			end
			if startswith(grup,"q$k")
                q[k] = parse(Float64,value)
            end
			for j=1:3
				if startswith(grup,"$k") && endswith(grup,"$j")
					CA[k,j] = parse(Float64,value)
				end
			end
            for i=1:n
				if startswith(grup,"Δg$i") && endswith(grup,"$k")
					A[i,k] = parse(Float64,value)
				end
            end
        end
        for i = 1:n-1
			if startswith(grup,"x$i")
                if occursin(":",value)
					xs = split(value, ':')
					inicio = parse(Float64,xs[1])
					paso = parse(Float64,xs[2])
					alto = parse(Float64,xs[3])
					x[i] = range(inicio,alto,step=paso)
				else
    				xs = split(value, ',')
					x[i] = parse.(Float64,xs)
					rango = false
                end
			end
        end
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = uniquac.pxy(n,T,CA,A*u"cal/mol",q,r,x,uni=usalida2)

    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = uniquac.txy(n,P,CA,A*u"cal/mol",q,r,x,uni=usalida2)
    end

	l = length(pp)

    if n==2
        #fig = go.Figure()
        #fig.add_trace(go.Scatter(x=np.array(xx[1,:]), y=np.array(ustrip(pp)),
          #          mode="lines",
         #           name="Liquido"))
        #fig.add_trace(go.Scatter(x=np.array(yy[1,:]), y=np.array(ustrip(pp)),
           #         mode="lines",
            #        name="Vapor"))
        #plt = repr("text/html",fig)


		#=p1 = scatter(;x=xx[1,:],y=ustrip(pp),name="Liquido")
		p2 = scatter(;x=yy[1,:],y=ustrip(pp),xaxis=attr(title="x₁ , y₁"),yaxis=attr(title=usalida),name="Vapor")
		p3 = plot([p1,p2])
        plt = repr("text/html",p3)=#
        p1=plot(xx[1,:],ustrip(pp),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(yy[1,:],ustrip(pp),xaxis="x₁ , y₁",yaxis=usalida,label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("UNIQUAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(xx),np.array(ustrip(pp)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(yy),np.array(ustrip(pp)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)
        #x1,x2=△(xx[1,:],xx[2,:])
		#y1,y2=△(yy[1,:],yy[2,:])
		#scatter(0.5,√3/2,label="x₃")
		#scatter(1,0,label="x₂")
		#scatter(0,0,label="x₁")
		#graficar3(x1,x2,y1,y2,pp,usalida)
		midic1 = R("UNIQUAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),plt,usalida,tabla,rango)

	else
		midic1 = R("UNIQUAC",n,l,round.(xx,sigdigits=6),round.(yy,sigdigits=6),round.(ustrip(pp),sigdigits=6),1,usalida,tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

function ff10_1()
	T = parse(Float64,@params(:T))
	Tc = parse(Float64,@params(:Tc))
	P = parse(Float64,@params(:P))
	Pc = parse(Float64,@params(:Pc))
	𝜔 = parse(Float64,@params(:𝜔))

	uT = @params(:uT)
	uTc = @params(:uTc)
	uP = @params(:uP)
	uPc = @params(:uPc)

	eeoo=eos_e(T,uT,P,uP,Tc,uTc,Pc,uPc,0,𝜔)

	T = T*uparse(uT)
	Tc = Tc*uparse(uTc)
	P = P*uparse(uP)
	Pc = Pc*uparse(uPc)

	H1,U1,S1,G1,A1,φ1,f1,z1,v1=EOS.Van_Der_Waals(T,P,Tc,Pc)
	H2,U2,S2,G2,A2,φ2,f2,z2,v2=EOS.Redlich_Kwong(T,P,Tc,Pc)
	H3,U3,S3,G3,A3,φ3,f3,z3,v3=EOS.Soave_Redlich_Kwong(T,P,Tc,Pc,𝜔)
	H4,U4,S4,G4,A4,φ4,f4,z4,v4=EOS.Peng_Robinson(T,P,Tc,Pc,𝜔)

	n1,n2,n3,n4 = length(z1),length(z2),length(z3),length(z4)
	m,m1 = findmax([n1,n2,n3,n4])

	midic1 = [ecuaciones_estado(H1,U1,S1,G1,A1,φ1,f1,z1,v1,n1),ecuaciones_estado(H2,U2,S2,G2,A2,φ2,f2,z2,v2,n2),ecuaciones_estado(H3,U3,S3,G3,A3,φ3,f3,z3,v3,n3),ecuaciones_estado(H4,U4,S4,G4,A4,φ4,f4,z4,v4,n4),m,eeoo,1]

    html(path"public/Reos_1.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function ff10_m()
	todasv = Genie.Requests.getpayload()

	nn = parse(Int,@params(:n))
	T = parse(Float64,@params(:T))
	P = parse(Float64,@params(:P))
	Tc = Vector{Any}(undef,nn)
	Pc = Vector{Any}(undef,nn)
	y = Vector{Any}(undef,nn)
	𝜔 = Vector{Any}(undef,nn)

	for (key,value) in todasv
        grup = String(key)
        for k=1:nn
			if startswith(grup,"Tc$k")
                Tc[k] = parse(Float64,value)
			end
			if startswith(grup,"Pc$k")
                Pc[k] = parse(Float64,value)
            end
			if startswith(grup,"y$k")
                y[k] = parse(Float64,value)
			end
			if startswith(grup,"𝜔$k")
                𝜔[k] = parse(Float64,value)
			end
        end
    end

	uT = @params(:uT)
	uTc = @params(:uTc)
	uP = @params(:uP)
	uPc = @params(:uPc)

	eeoo=eos_e(T,uT,P,uP,Tc,uTc,Pc,uPc,y,𝜔)

	T = T*uparse(uT)
	Tc = Tc*uparse(uTc)
	P = P*uparse(uP)
	Pc = Pc*uparse(uPc)

	H1,U1,S1,G1,A1,φ1,f1,z1,v1=EOS.Van_Der_Waals_M(T,P,Tc,Pc,y)
	H2,U2,S2,G2,A2,φ2,f2,z2,v2=EOS.Redlich_Kwong_M(T,P,Tc,Pc,y)
	H3,U3,S3,G3,A3,φ3,f3,z3,v3=EOS.Soave_Redlich_Kwong_M(T,P,Tc,Pc,y,𝜔)
	H4,U4,S4,G4,A4,φ4,f4,z4,v4=EOS.Peng_Robinson_M(T,P,Tc,Pc,y,𝜔)

	n1,n2,n3,n4 = length(z1),length(z2),length(z3),length(z4)
	m,m1 = findmax([n1,n2,n3,n4])

	midic1 = [ecuaciones_estado(H1,U1,S1,G1,A1,φ1,f1,z1,v1,n1),ecuaciones_estado(H2,U2,S2,G2,A2,φ2,f2,z2,v2,n2),ecuaciones_estado(H3,U3,S3,G3,A3,φ3,f3,z3,v3,n3),ecuaciones_estado(H4,U4,S4,G4,A4,φ4,f4,z4,v4,n4),m,eeoo,nn]

    html(path"public/Reos_m.jl.html", error=midic1)
    #negotiate_content(request(), serve_static_file("vanlaar.html"), params::Params
end

function ff11()
	todasv = Genie.Requests.getpayload()
    h = parse(Bool,@params(:hidrocarburo,"false"))

    n = parse(Int,todasv[:n])
    T = parse(Float64,todasv[:T])
    P = parse(Float64,todasv[:P])
	
    tipo = @params(:tipo)
    uT = uparse(todasv[:unidadT])
    uP = uparse(todasv[:unidadP])
    usalida = uparse(todasv[:usalida])
	uMW = uparse(todasv[:uMW])
    MW = Vector{Float64}(undef,n)*uMW

    K = Matrix{Float64}(undef,n,n)
    xx = Vector{Float64}(undef,n)
    x = Vector{Any}(undef,n-1)

    rango = true 

    for i = 1:n-1
        value = String(todasv[Symbol("x",i)])
        if occursin(":",value)
            xs = split(value, ':')
            inicio = parse(Float64,xs[1])
            paso = parse(Float64,xs[2])
            alto = parse(Float64,xs[3])
            x[i] = range(inicio,alto,step=paso)
        else
            xs = split(value, ',')
            x[i] = parse.(Float64,xs)
            rango = false
        end
        
    end

    if h
        for i=1:n
            MW[i] =  parse(Float64,todasv[Symbol("MW",i)])*uMW
            for j=1:n
                K[j,i] = parse(Float64,todasv[Symbol("Δg",j,",",i)])
            end
        end
        mix1 = saft.mix(MW,xx,K)
    else
        uϵ = uparse(todasv[:uϵ])
        uσ = uparse(todasv[:uσ])
        m = Vector{Float64}(undef,n)
        σ = Vector{Float64}(undef,n)*uσ
        ϵ = Vector{Float64}(undef,n)*uϵ
        for i=1:n 
            m[i] =  parse(Float64,todasv[Symbol("m",i)])
            σ[i] =  parse(Float64,todasv[Symbol("σ",i)])*uσ
            ϵ[i] =  parse(Float64,todasv[Symbol("ϵ",i)])*uϵ
            MW[i] =  parse(Float64,todasv[Symbol("MW",i)])*uMW
            for j=1:n
                K[j,i] = parse(Float64,todasv[Symbol("Δg",j,",",i)])
            end
        end
        mix1 = saft.mix(MW,xx,m,σ,ϵ,K)
    end

    if tipo=="Pxy"
		tabla = "Presión"
		T = T*uT
        P = P*uP
		x,y,p = saft.pxy(T,P,mix1,x,uni=usalida)

    else
    	tabla = "Temperatura"
    	P = T*uparse(uni)
    	usalida2 = uparse(usalida)
		xx,yy,pp = wilson.txy(n,P,CA,A*u"cal/mol",v,x,uni=usalida2)
    end

	l = length(p)

    if n==2
        p1=plot(x[1,:],ustrip(p),label="Liquido",legend=(1.02, 1.0))
        p1=plot!(y[1,:],ustrip(p),xaxis="x₁ , y₁",yaxis=todasv[:usalida],label="Vapor",legend=(1.02, 1.0))
        plt = repr("text/html",p1)
		midic1 = R("PC-Saft",n,l,round.(x,sigdigits=6),round.(y,sigdigits=6),round.(ustrip(p),sigdigits=6),plt,todasv[:usalida],tabla,rango)
	elseif n==3
        fig1 = ff.create_ternary_contour(np.array(x),np.array(ustrip(p)),pole_labels=["x1","x2","x3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Liquido","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
		fig2 = ff.create_ternary_contour(np.array(y),np.array(ustrip(p)),pole_labels=["y1","y2","y3"],showscale=true,ncontours=20,colorscale="Viridis",title=PyDict(Dict("text"=>"Vapor","xanchor"=>"center","y"=>0.9,"x"=>0.5)))
        plt = repr("text/html",fig1)*repr("text/html",fig2)

		midic1 = R("PC-Saft",n,l,round.(x,sigdigits=6),round.(y,sigdigits=6),round.(ustrip(p),sigdigits=6),plt,todasv[:usalida],tabla,rango)

	else
		midic1 = R("PC-Saft",n,l,round.(x,sigdigits=6),round.(y,sigdigits=6),round.(ustrip(p),sigdigits=6),1,todasv[:usalida],tabla,rango)
    end

    html(path"public/resulvanlaar.jl.html", e = midic1)
end

visita = [0]
route("/") do
    #println(Genie.Router.@params)
    #println(Sessions.session(Genie.Router.@params))
    #sess = Sessions.session(Genie.Router.@params)
    #println("id ----",Genie.Sessions.id())
  
  #Sessions.set!(sess, :visit_count, Sessions.get(sess, :visit_count, 0)+1)
  visita[1] += 1
  
  """
  <!DOCTYPE html>
  <html lang="en">
      <head>
          <meta charset="utf-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="description" content="">
          <meta name="author" content="">
          <title>TermoQuímica</title>
          <link href="css/genie/style2.css" rel="stylesheet">
          <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:800,900,700,600,500,400&display=swap">
          <script>/* Pinegrow Interactions, do not remove */ try{if(!document.documentElement.hasAttribute('data-pg-ia-disabled')) { var style = document.createElement('style');var pgcss='html:not(.pg-ia-no-preview) [data-pg-ia-hide=""] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show=""] {opacity:1;visibility:visible;display:block;}';if(document.documentElement.hasAttribute('data-pg-id')?document.documentElement.hasAttribute('data-pg-mobile'):(screen.width<1000&&screen.height<1000)){pgcss+='html:not(.pg-ia-no-preview) [data-pg-ia-hide="mobile"] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show="mobile"] {opacity:1;visibility:visible;display:block;}';}else{pgcss+='html:not(.pg-ia-no-preview) [data-pg-ia-hide="desktop"] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show="desktop"] {opacity:1;visibility:visible;display:block;}';}style.innerHTML=pgcss;document.querySelector('head').appendChild(style);}}catch(e){console&&console.log(e);}</script>
      </head>
      <body data-pg-ia-scene='{"d":"0","s":"onLeave","dbg":"+++++","l":[{"t":"nav","a":{"n":"","l":[{"t":"","l":[{"t":"set","p":0,"d":0,"l":{"position":"fixed","top":0,"zIndex":99,"width":"auto","left":0,"right":0,"backgroundColor":"#000000","boxShadow":"0 20px 30px #f4f4f8","y":"-100%"}},{"t":"tween","p":0,"d":0.5,"l":{"y":"0%"}}]},{"t":"$header","l":[{"t":"set","p":0,"d":0,"l":{"marginTop":"100px"}}]}]},"p":"time","rev":"true"}],"o":"500px"}'>
          <header>
              <nav class="barra">
                  <a class="logo" href="/">Logo</a>
                  <div class="contenedor-nav">
                      <ul class="primeros-botones">
                          <li>
                              <a href="./">Home</a>
                          </li>
                          <li class="contenedor-nav2">
                              <a>Métodos</a>
                              <ul class="primeros-botones2">
                                  <li>
                                      <a href="./eos">EOS</a>
                                  </li>
                                  <li>
                                      <a>Liquido/Vapor</a>
                                      <ul class="ul2">
                                          <li>
                                              <a href="./ideal">Ideal</a>
                                          </li>
                                          <li>
                                              <a href="./margules">Margules</a>
                                          </li>
                                          <li>
                                              <a href="./vanlaar">Van Laar</a>
                                          </li>
                                          <li>
                                              <a href="./wilson">Wilson</a>
                                          </li>
                                          <li>
                                              <a href="./wilsonmod">Wilson Modificado</a>
                                          </li>
                                          <li>
                                              <a href="./nrtl">NRTL</a>
                                          </li>
                                          <li>
                                              <a href="./uniquac">UNIQUAC</a>
                                          </li>
                                          <li>
                                              <a href="./unifac">UNIFAC</a>
                                          </li>
                                          <li>
                                              <a href="./unifacmod">UNIFAC Modificado</a>
                                          </li>
                                          <li>
                                              <a href="./saft">PC Saft</a>
                                          </li>
                                      </ul>
                                  </li>
                              </ul>
                          </li>
                          <li>
                              <a href="./build/index.html" target="_blank">Documentación</a>
                          </li>
                      </ul>
                  </div>
              </nav>
              <div class="contenedor-flex">
                  <div class="contenido-header">
                      <h1 class="header-h1" data-pg-ia='{"l":[{"trg":"load","a":"fadeInUp"}]}' data-pg-ia-hide>TermoQuímica</h1>
                      <p class="header-p" data-pg-ia='{"l":[{"trg":"load","a":"fadeInUp","dly":".3"}]}' data-pg-ia-hide>Pagina para calcular el equilibrio liquido/vapor</p>
                      <button class="boton-header" data-pg-ia='{"l":[{"trg":"load","dly":".6","a":{"n":"","l":[{"t":"","l":[{"t":"set","p":0,"d":0,"l":{"autoAlpha":0,"y":"100%","transition":"none"}},{"t":"tween","p":0,"d":1,"l":{"autoAlpha":1,"y":"0%"}}]}]}}]}' data-pg-ia-hide>Ir</button>
                  </div>
                  <div class="contenedor-imagen"></div>
              </div>
          </header>
          <section class="seccion1">
              <div class="contenedor-flex2">
                  <div class="contenido-header2">
                      <h2>Velocidad</h2>
                      <p style="width: 30vw;">El uso de Julia hace que todos los cálculos involucrados sean realmente rápidos.</p>
                      <a href="https://julialang.org/" target="_blank"><button class="boton-header2">Leer más</button></a> 
                  </div>
                  <div class="contenedor-imagen">
                      <img src="img/genie/julia.svg">
                  </div>
              </div>
              <div class="contenedor-flex2" style="padding-top: 181px;" data-pg-ia-scene='{"l":[{"t":"h3","a":"fadeInUp","s":"30","p":"time"},{"t":".h2-centrado","a":"fadeInUp","p":"time","s":"30"}]}'>
                  <div class="contenido-header3">
                      <h3 class="h3-rojo" data-pg-ia-hide>Características de la pagina web</h3>
                      <h2 class="h2-centrado" data-pg-ia-hide>Descubra las poderosas particularidades de <strong>TermoQuímica</strong> a continuación</h2>
                  </div>
              </div>
              <div class="contenedor-flex3" style="padding-top: 30px; padding-bottom: 100px;" data-pg-ia-scene='{"dbg":"++++","l":[{"t":".fila-flex","a":{"n":"","l":[{"t":"","l":[{"t":"set","p":0,"d":0,"l":{"autoAlpha":0,"y":"100%"}},{"t":"tween","p":0,"d":1,"s":0.25,"l":{"autoAlpha":1,"y":"0%"}}]}]},"p":"time","s":"15"}]}'>
                  <div class="fila-flex" data-pg-ia-hide>
                      <div class="borde-row-rojo">
                          <div class="row-rojo">
                              <img src="img/genie/row1.svg"/>
                          </div>
                          <h5>Modelos</h5>
                          <p class="p-row">Mas de 10 modelos disponibles, como Van Laar, Wilson, NRTL, UNIFAC, UNIQUAC, entre otros ...</p>
                      </div>
                  </div>
                  <div class="fila-flex" data-pg-ia-hide>
                      <div class="borde-row-azul">
                          <div class="row-azul azul">
                              <img src="img/genie/row2.svg"/>
                          </div>
                          <h5>Interactividad&nbsp;</h5>
                          <p class="p-row">Obtenga sus resultados en graficas completamente interactivas.</p>
                      </div>
                  </div>
                  <div class="fila-flex" data-pg-ia-hide>
                      <div class="borde-row-verde">
                          <div class="row-verde">
                              <img src="img/genie/row3.svg"/>
                          </div>
                          <h5>No. de Componentes</h5>
                          <p class="p-row">Puede hacer calculos hasta para 10 componentes.</p>
                      </div>
                  </div>
                  <div class="fila-flex" data-pg-ia-hide>
                      <div class="borde-row-amarillo">
                          <div class="row-amarillo">
                              <img src="img/genie/row4.svg"/>
                          </div>
                          <h5>Estetica</h5>
                          <p class="p-row">Todo esto y mucho mas desplegado en un hermoso diseño.</p>
                      </div>
                  </div>
              </div>
          </section>
          <section style="background-image: url('img/genie/patron.png'); background-size: cover; text-align: right; background-position: left bottom;">
              <div class="contenedor-flex4" style="padding-top: 58px; padding-bottom: 438px;">
                  <div class="contenido-header4">
                      <h3 class="h3-rojo2">De alumnos para alumnos</h3>
                      <h2>Explore <strong>TermoQuímica</strong> y vea su importancia<br> para la Ingeniería Química</h2>
                      <p>El equilibrio líquido-vapor es útil en el diseño de columnas<br> para destilación, especialmente destilación fraccionada<br> que es una especialidad de los ingenieros químicos</p>
                  </div>
              </div>
          </section>
          <section style="text-align: center; background-image: url('img/genie/sol.svg'); background-repeat: no-repeat; background-size: contain; justify-content: center; display: flex; background-position: center bottom;">
              <div class="contenedor-flex2">
			  <div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: space-around;">
    <div data-pg-collapsed>
        <h2>$(visita[1]) <strong>+</strong></h2>
        <p style="max-width: 540px;">Visitantes en todo el mundo estan disfrutando <strong>TermoQuimica</strong> </p>
    </div>
    <div data-pg-collapsed>
        <div id="no01" class="wrapper">
            <div class="boxes" style="display: flex; justify-content: space-evenly; background-position: right bottom;">
                <div class="box">
                    <img src="img/genie/norte-america.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/sudamerica.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/europa.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/africa.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/asia.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/sudasia.jpg" width="150"/>
                </div>
                <div class="box">
                    <img src="img/genie/autralia.jpg" width="150"/>
                </div>
            </div>
        </div>
    </div>
</div>
                  <div class="contenido-header5">
                      <h2>Pruebe ahora mismo la pagina<br> y sorpréndase de lo que puede hacer<br> por usted</h2>
                      <button class="boton-header3">Leer más</button>
                  </div>
              </div>
          </section>
          <footer>
              <div class="fu1 pg-empty-placeholder"></div>
              <div class="fu2">
                  <div style="display: flex; align-items: center;">
                      <div class="redsocial" style="background-image: -webkit-linear-gradient(180deg, rgb(3, 73, 166) 0%, rgb(21, 194, 123) 100%); align-items: center;">
                          <a href="https://julialang.org/" target="_blank"><img src="img/genie/face.svg"/></a>
                      </div>
                      <div class="redsocial" style="background-image: -webkit-linear-gradient(180deg, rgb(68, 83, 172) 0%, rgb(3, 169, 219) 100%);">
                          <img src="img/genie/twitter.svg"/>
                      </div>
                      <div class="redsocial" style="background-image: -webkit-linear-gradient(180deg, rgb(74, 14, 143) 0%, rgb(180, 48, 167) 100%);">
                          <img src="img/genie/mail.svg"/>
                      </div>
                  </div>
                  <div>
                      <p style="color: rgba(255, 255, 255, 0.5); padding-top: 51px; font-size: 18px;">© derechos de autor 2020 por Emilio Alvizo Velazquez</p>
                  </div>
              </div>
          </footer>
          <script type="text/javascript" src="js/genie/pgia.js"></script>
		  <script src = "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js" > </script>
        <script type="text/javascript" src="js/genie/animacion.js"></script>
      </body>
  </html>
  
  """
end

route("/ideal", sustituye1)
route("/f1", f1)
route("/Rideal", ff1)

route("/margules", sustituye2)
route("/f2", f2)
route("/Rmargules", ff2)

route("/vanlaar", sustituye3)
route("/f3", f3)
route("/Rvanlaar", ff3)

route("/wilson", sustituye4)
route("/f4",method = POST, f4)
route("/Rwilson", ff4)

route("/wilsonmod", sustituye5)
route("/f5",method = POST, f5)
route("/Rwilsonmod", ff5)

route("/nrtl", sustituye6)
route("/f6",method = POST, f6)
route("/Rnrtl", ff6)

route("/unifac", sustituye7)
route("/f7",method = POST, f7)
route("/Runifac", ff7)

route("/uniquac", sustituye8)
route("/f8",method = POST, f8)
route("/Runiquac", ff8)

route("/eos", sustituye10)
route("/f10", f10)
route("/ff10_1", ff10_1)
route("/ff10_m", ff10_m)

route("/saft", sustituye11)
route("/f11",method = POST, f11)
route("/Rsaft", ff11)