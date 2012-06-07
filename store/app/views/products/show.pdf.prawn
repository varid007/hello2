pdf.text "Hello, World!"  
	
	  pdf.image @product.photo.path
	  pdf.text "Order ##{@product.id}", :size => 30, :style => :bold 
      pdf.text @product.name  
      pdf.text @product.description
	  pdf.text "Harga : #{@product.price}"
      pdf.text "Berat : #{@product.weight}"
      pdf.text "User : #{@product.user.name}"
      pdf.text "Cateory : #{@product.category.name}"