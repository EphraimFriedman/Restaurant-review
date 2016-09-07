var Employee = function(args) {
	this.firstName = args["firstName"] || ""
	this.sales = args["sales"] || []
};

Employee.prototype.totalSales = function() {
	// original code
		// var sum = 0
		// for(i = 0; i < this.sales.length; i++){
		// 	sum += this.sales[i]
		// }
		// return sum

	// refactored code
	var total = this.sales.reduce(function(sum, sale){
		return sum + sale;
	});
	return total
};

Employee.prototype.averageSales = function() {
	return this.totalSales() / this.sales.length
};
