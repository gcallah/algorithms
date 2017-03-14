"""
Contains basic classes for holding graph information.
"""

from random import shuffle, randint, choice

VID = 0
ALIST = 1

NOT_DISCOVERED = -1
NOT_FINISHED = -1

# to test initializing by adjancency list:
test_alist = [
                [1, [2, 3, 4]],
                [2, [9, 10]],
                [3, [7, 8]],
                [4, [5, 6]],
                [10, [11, 12]],
             ]

# to test initializing by edge list:
test_elist = [(1, 2), (1, 3), (3, 5), (4, 5), (5, 6), (5, 9), (6, 7),
              (6, 9), (7, 8)]

# to test for detecting disconnected graphs:
test_dis_elist = [(1, 2), (1, 3), (3, 5), (4, 5), (5, 6), (5, 9), (6, 7),
                  (6, 9), (8, 13)]  # this last edge is not connected:
                                    # should be revealed by isconnected()


class Vertex():
    """
    The nodes in our graph.
    """
    def __init__(self, vid, neighbor=None):
        """
            Args:
                vid: this node's id

            Returns:
                None
        """
        self.vid = vid
        self.color = None
        self.pred = None
        self.discover = NOT_DISCOVERED
        self.finish = NOT_FINISHED
        self.adj_list = []
        if neighbor is not None:
            self.adj_list.append(neighbor)

    def __str__(self):
        return str(self.vid)

    def add_neighbor(self, neighbor):
        self.adj_list.append(neighbor)


class Edge():
    """
    The edges of our graph.
    """
    def __init__(self, v1, v2):
        self.v1 = v1
        self.v2 = v2

    def __str__(self):
        return str(self.v1) + "<-->" + str(self.v2)

    def get_vertices(self):
        return (self.v1, self.v2)

    def is_incident(self, v):
        return (v == self.v1) or (v == self.v2)


def extract_vertex_set(edges):
    """
    Returns a set of all the vertices in the edge collection.
    """
    vertices = set()
    for e in edges:
        (u, v) = e.get_vertices()
        vertices.add(u)
        vertices.add(v)
    return vertices


def graph_from_vlist(vlist):
    """
    Creates a graph of disconnected vertices.
    """
    g = Graph([])
    for v in vlist:
        g.add_vertex(v)
    return g


def graph_from_rand(n):
    """
    Creates a random, connected graph with n vertices.
    "Random" here means we don't know which vertices are connected.
    We want to be able to do this for testing purposes.
    """
    verts = [i for i in range(n)]
    shuffle(verts)
    edges = []
    seen = []

    g = graph_from_vlist(verts)

    while len(seen) < len(verts):
        v = None
        u = randint(0, n - 1)
        if len(seen) == 0:
            v = randint(0, n - 1)
            seen.append(v)
        else:
            v = choice(seen)
        if (u == v) or (u in seen):
            # if we've seen u, it will create a cycle to
            # make an edge between it and another seen node
            continue
        else:
            print("Trying to create random graph with u = "
                  + str(u) + " and v = " + str(v))
            print("Seen = " + str(seen))
            g.add_edge(u, v) 
            seen.append(u)
    return g


def graph_from_alist(alist):
    """
    Read an adjacency list of the format [vertex, [neighbor, neighbor...]]
    and create a graph from that by making an edge list.
    """
    elist = []
    for v in alist:
        vid = v[VID]

        for uid in v[ALIST]:
            elist.append((vid, uid))
    return Graph(elist)


class Graph():
    """
    The graph structure with member functions supporting a variety
    of useful things to do with a graph.
    """

    def __init__(self, elist, directed=False):
        """
        Args:
            elist: a list of edges by id.
            directed: is thisa directed graph?
        """
        # the following item is a heterogeneous list. The first item is a node,
        # but the rest of the items are just node ids.
        self.vertices = {}
        self.edges = []
        self.directed = directed

        for e in elist:
            self.add_edge(e[0], e[1])

        if not self.isconnected():
            print("Warning: this graph is not connected.")

    def __str__(self):
        s = ''
        for e in self.edges:
            s += str(e) + "\n"
        return s

    def add_vertex(self, vid, uid=None):
        if vid not in self.vertices:
            self.vertices[vid] = Vertex(vid, uid)
        elif uid is not None:
            self.vertices[vid].add_neighbor(uid)

    def add_edge(self, vid, uid):
        # We can safely add these vertices, because we check for dups
        # before adding:
        self.add_vertex(vid, uid)
        # for directed graphs, you have to explicitly
        # add both directions of you want both:
        if not self.directed:    
            self.add_vertex(uid, vid)
        self.edges.append(Edge(vid, uid))

    def isconnected(self, vseen=None, vid=None):
        """
        Is this graph connected?
        Called recursively.
        """
        firstv = False
        if vseen is None:  # then vid will be None as well
            if len(self.edges) < 1:
                if len(self.vertices) <= 1:
                    return True  # a graph with one vertex is connected
                else:
                    return False
            firstv = True
            vseen = set()
            e = self.edges[0]
            vid = e.get_vertices()[0]

        vseen.add(vid)
        alist = self.get_adj_list(vid)
        # print("Got alist of " + str(alist))
        if alist is not None and len(alist) > 0:
            for u in alist:
                if u not in vseen:
                    self.isconnected(vseen, u)
        if not firstv:  # lower level calls just return True 
            return True
        elif len(vseen) == len(self.vertices):
            return True
        else:
            return False

    def get_vertex(self, vid):
        return self.vertices[vid]

    def get_adj_list(self, vid):
        if vid in self.vertices:
            return self.vertices[vid].adj_list
        else:
            return None

    def get_edges(self):
        return self.edges

    def get_vertices(self):
        """
        This returns the actual vertex objects.
        """
        return list(self.vertices.values())

    def iscover(self, edges):
        """
        See if this edge set is a vertex cover.
        Return:
            True if it is, False if not.
        """
        cover_set = extract_vertex_set(edges)
        for e in self.edges:
            (u, v) = e.get_vertices
            if u not in cover_set and v not in cover_set:
                return False
        return True

