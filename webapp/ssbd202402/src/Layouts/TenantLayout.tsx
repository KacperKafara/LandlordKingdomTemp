import { FC } from "react";
import BaseLayout, { NavigationLink } from "./BaseLayout";
import { Navigate, Outlet } from "react-router-dom";
import { useUserStore } from "@/store/userStore";

const links: NavigationLink[] = [
  {
    label: "Role Request",
    path: "./role-request",
  },
  {
    label: "currentRents",
    path: "./current-rents",
  }
];

const TenantLayout: FC = () => {
  const { roles, activeRole } = useUserStore();
  if (!roles?.includes("TENANT")) {
    return <Navigate to={"/error"} />;
  }

  if (activeRole !== "TENANT") {
    return <Navigate to={"/error"} />;
  }

  return (
    <BaseLayout type="tenant" links={links}>
      <Outlet />
    </BaseLayout>
  );
};

export default TenantLayout;
