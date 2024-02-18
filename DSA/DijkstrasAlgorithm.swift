//
//  DijkstrasAlgorithm.swift
//  Experiment
//
//  Created by Abdullah on 05/06/2023.
//

import Foundation
class Node : CustomStringConvertible {
    // unique identifier required for each node
    var identifier : Int
    var distance : Int = Int.max
    var edges = [Edge]()
    var visited = false
    
    var description: String {
        var edgesString = String()
        edges.forEach{  edgesString.append($0.description)}
        return "{ Node, identifier: \(identifier.description) +  Edges: \(edgesString) + }"
    }
    
    init(visited: Bool, identifier: Int, edges: [Edge]) {
        self.visited = visited
        self.identifier = identifier
        self.edges = edges
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

class Edge {
    var from: Node // does not actually need to be stored!
    var to: Node
    var weight: Int
    var description : String {
        return "{ Edge, from: \(from.identifier), to: \(to.identifier), weight: \(weight) }"
        
    }
    init(to: Node, from: Node, weight: Int) {
        self.to = to
        self.weight = weight
        self.from = from
    }
}

class Graph {
    var nodes: [Node] = []
}


// Complete the quickestWayUp function below.
func setupGraphwith(edges: [[Int]]) -> Graph {
    let graph = Graph()
    
    // create all the nodes
    // The first and last node need to be included, so need nodes from "to" and "from"
    let rr = edges.map{ $0[0]}
    let rr2 = edges.map{ $0[1]}
    let rr3 = Set(rr+rr2)
    print("rr is \(rr)")
    print("rr2 is \(rr2)")
    print("rr3 is \(rr3)")
    print("rr4 is \(rr + rr2)")
    var asdf = ""
    //print("asd3 is \(edges.map{ $0[2]})")
    let nodeNames = Set ( edges.map{ $0[0] } + edges.map{ $0[1]} )
    print("nodeNames is \(nodeNames)")
    for node in nodeNames {
        let newNode = Node(visited: false, identifier: node, edges: [])
        graph.nodes.append(newNode)
    }
    
    // create all the edges to link the nodes
    for edge in edges {
        if let fromNode = graph.nodes.first(where: { $0.identifier == edge[0] }) {
            if let toNode = graph.nodes.first(where: { $0.identifier == edge[1] }) {
                let forwardEdge = Edge(to: toNode, from: fromNode, weight: edge[2])
                fromNode.edges.append(forwardEdge)
            }
        }
    }
    return graph
}

func shortestPath (source: Int, destination: Int, graph: Graph) -> Int {

    var currentNode = graph.nodes.first{ $0.identifier == source }!
    currentNode.visited = true
    currentNode.distance = 0
    var toVisit = [Node]()
    toVisit.append(currentNode)
    print("they are \(currentNode.edges.map {$0.weight})")
    while ( !toVisit.isEmpty) {
        toVisit = toVisit.filter{ $0.identifier != currentNode.identifier }
        currentNode.visited = true
        // Go to each adjacent vertex and update the path length
        for connectedEdge in currentNode.edges {
            let dist = currentNode.distance + connectedEdge.weight

            if (dist < connectedEdge.to.distance) {

                connectedEdge.to.distance = dist
                toVisit.append(connectedEdge.to)
                if (connectedEdge.to.visited == true) {

                    connectedEdge.to.visited = false
                }
            }
        }

        currentNode.visited = true
        //set current node to the smallest vertex
        if !toVisit.isEmpty {
            currentNode = toVisit.min(by: { (a, b) -> Bool in
                return a.distance < b.distance
            })!
        }

        if (currentNode.identifier == destination) {
            return currentNode.distance
        }
    }
    
    return -1
}


func setupGraph(edges: [[Int]]) -> Graph {
    
    var graph = Graph()
    
    //let us create nodes first (also known as vertices)
    let uniqueNodeList = Set (edges.map{$0[0]} + edges.map{$0[1]})
    for el in uniqueNodeList {
        let node = Node(visited: false, identifier: el, edges: [])
        graph.nodes.append(node)
    }
    
    //Now let us add egdes
    for edge in edges {
        if let fromNode = graph.nodes.first(where: {$0.identifier == edge[0]}) {
            if let toNode = graph.nodes.first(where: {$0.identifier == edge[1]}){
                let edge = Edge(to: fromNode, from: toNode, weight: edge[2])
                fromNode.edges.append(edge)
            }
        }
    }
    return graph
}



func shortestPath2(source: Int, destination: Int, graph: Graph) -> Int {
    //let us first set the first node as the current node
    var currentNode = graph.nodes.first(where: { $0.identifier == source})!
    currentNode.visited = true
    currentNode.distance = 0
    var toVisit = [Node]()
    toVisit.append(currentNode)
    
    while !toVisit.isEmpty {
        toVisit = toVisit.filter{$0.identifier != currentNode.identifier}
        for currentEdge in currentNode.edges {
            var dist = currentNode.distance + currentEdge.weight
            if dist < currentEdge.to.distance {
                currentEdge.to.distance = dist
                toVisit.append(currentEdge.to)
            }
        }
        
        //Now, we want set the next current node
        currentNode.visited = true
        if !toVisit.isEmpty {
            currentNode = toVisit.min(by: {$0.distance < $1.distance})!
        }
        
        //Here, we want to check it the destination is met
        if currentNode.identifier == destination {
            return currentNode.distance
        }
    }
    
    return -1
}
