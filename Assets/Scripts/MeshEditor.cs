using UnityEditor;
using UnityEngine;

public class MeshEditor 
{
    [MenuItem("Tools/CreateMesh %#k")]
    public static void CreateMesh()
    {
        Mesh mesh = new Mesh();

        // [0] [1]
        // [2] [3]
        Vector3[] vertices = new Vector3[4];
        vertices[0] = new Vector3(-0.5f, 0.5f);
        vertices[1] = new Vector3(0.5f, 0.5f);
        vertices[2] = new Vector3(-0.5f, -0.5f);
        vertices[3] = new Vector3(0.5f, -0.5f);
        mesh.vertices = vertices;

        Color[] colors = new Color[4];
        colors[0] = Color.red;
        colors[1] = Color.green;
        colors[2] = Color.red;
        colors[3] = Color.green;
        mesh.colors = colors;

        // https://celestialbody.tistory.com/7
        Vector2[] uv = new Vector2[4];
        uv[0] = new Vector3(0, 1);
        uv[1] = new Vector3(1, 1);
        uv[2] = new Vector3(0, 0);
        uv[3] = new Vector3(1, 0);
        mesh.uv = uv;

        // index buffer
        int[] triangles = new int[6];
        triangles[0] = 0;
        triangles[1] = 1;
        triangles[2] = 2;
        triangles[3] = 2;
        triangles[4] = 1;
        triangles[5] = 3;

        mesh.triangles = triangles;

        AssetDatabase.CreateAsset(mesh, "Assets/Resources/CodeMesh.asset");
        AssetDatabase.SaveAssets();

        GameObject go = GameObject.Find("CodeMesh");
        if (go != null)
            go.GetComponent<MeshFilter>().mesh = mesh;
    }
}
