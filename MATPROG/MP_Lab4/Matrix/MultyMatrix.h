#pragma once
// ����������� ������ ��� ��������� ������
// ������� ���������� ����������� ���������� �������� ��������� 
#define OPTIMALM_PARM(x) ((int*)x)    // ��� ������������� 2������� �������

int OptimalM(       // �������� 
	int i,          //  [in] ����� ������ �������  
	int j,          //  [in] ����� ��������� �������  
	int n,          //  [in] ���������� ������
	const int c[],  //  [in] ������ ������������  
	int* s          //  [out] ���������: ������� ������  
);

int OptimalMD(      // ������������ ����������������  
	int n,          //  [in] ���������� ������
	const int c[],  //  [in] ������ ������������  
	int* s          //  [out] ���������: ������� ������  
);
