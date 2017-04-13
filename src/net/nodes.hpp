class node {
public:
	node(std::vector<node*> connections);
private:

};

class sensor {
public:
	sensor(void (*preprocessor)(int *), std::vector<node> input_nodes, int num_nodes);
	void preprocess(std::vector<int> data);

private:
	void (sensor::*preprocess)(int *);
	std::vector<node> nodes;
};
